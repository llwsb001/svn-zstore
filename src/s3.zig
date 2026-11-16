//! Minimal S3 client (SigV4, path-style addressing) over libcurl.
//!
//! Only the three verbs the backend needs: GET, PUT, DELETE, plus HEAD.
//! Everything is synchronous; svnserve is a forking process model and each
//! repository operation is serialised by the FS API anyway.
const std = @import("std");
const cu = @import("curl_bindings.zig");

pub const Error = error{
    Request,
    Status,
    OutOfMemory,
    /// Conditional PUT saw a stale precondition (HTTP 412).
    Precondition,
};

/// Precondition attached to a PUT.
pub const Cond = union(enum) {
    none,
    /// `If-None-Match: *` — create only, fails when the object exists.
    if_absent,
    /// `If-Match: <etag>` — update only, fails when the object changed.
    if_match: []const u8,
};

pub const Config = struct {
    endpoint: []const u8 = "http://127.0.0.1:9000",
    region: []const u8 = "us-east-1",
    bucket: []const u8 = "svn",
    access_key: []const u8 = "zstore",
    secret_key: []const u8 = "zstore",
    /// Key prefix inside the bucket, usually the repository uuid.
    prefix: []const u8 = "",
    insecure_tls: bool = true,
};

const Sha256 = std.crypto.hash.sha2.Sha256;
const HmacSha256 = std.crypto.auth.hmac.sha2.HmacSha256;

const SignedHeaders = "host;x-amz-content-sha256;x-amz-date";

extern "c" fn time(t: ?*i64) i64;

fn nowSecs() i64 {
    return time(null);
}

const Response = struct {
    alloc: std.mem.Allocator,
    body: std.ArrayList(u8) = .empty,
    etag: ?[]u8 = null,
};

fn headerCb(ptr: [*c]u8, size: usize, nmemb: usize, userdata: ?*anyopaque) callconv(.c) usize {
    const total = size * nmemb;
    if (userdata == null) return 0;
    const resp: *Response = @ptrCast(@alignCast(userdata.?));
    const line = ptr[0..total];
    // Capture the ETag header so callers can use it as an If-Match token.
    if (line.len > 5 and std.ascii.eqlIgnoreCase(line[0..5], "ETag:")) {
        var v = std.mem.trim(u8, line[5..], " \t\r\n");
        if (v.len >= 2 and v[0] == '"') v = v[1 .. v.len - 1];
        if (resp.etag) |old| resp.alloc.free(old);
        resp.etag = resp.alloc.dupe(u8, v) catch null;
    }
    return total;
}

fn writeCb(ptr: [*c]u8, size: usize, nmemb: usize, userdata: ?*anyopaque) callconv(.c) usize {
    const total = size * nmemb;
    if (userdata == null) return 0;
    const resp: *Response = @ptrCast(@alignCast(userdata.?));
    resp.body.appendSlice(resp.alloc, ptr[0..total]) catch return 0;
    return total;
}

pub const Client = struct {
    alloc: std.mem.Allocator,
    cfg: Config,
    curl: *cu.CURL,

    pub fn init(alloc: std.mem.Allocator, cfg: Config) !Client {
        _ = cu.curl_global_init(cu.CURL_GLOBAL_ALL);
        const handle = cu.curl_easy_init() orelse return Error.Request;
        return .{ .alloc = alloc, .cfg = cfg, .curl = handle };
    }

    pub fn deinit(self: *Client) void {
        cu.curl_easy_cleanup(self.curl);
    }

    /// Returns null when the object does not exist. Caller owns the bytes.
    pub fn get(self: *Client, key: []const u8) !?[]u8 {
        var res = try self.request(.GET, key, null, null, .{});
        defer res.deinit();
        if (res.code == 404) return null;
        if (res.code != 200) return Error.Status;
        return try self.alloc.dupe(u8, res.body.items);
    }

    pub fn exists(self: *Client, key: []const u8) !bool {
        var res = try self.request(.HEAD, key, null, null, .{});
        defer res.deinit();
        if (res.code == 404) return false;
        if (res.code == 200) return true;
        return Error.Status;
    }

    pub fn put(self: *Client, key: []const u8, body: []const u8, content_type: []const u8) !void {
        var res = try self.request(.PUT, key, body, content_type, .{});
        defer res.deinit();
        if (res.code != 200) {
            std.log.err("zstore: PUT {s} -> {d}: {s}", .{ key, res.code, res.body.items });
            return Error.Status;
        }
    }

    /// PUT honouring a precondition. Returns the new ETag (caller frees),
    /// or error.Precondition when the precondition did not hold.
    pub fn putCond(
        self: *Client,
        key: []const u8,
        body: []const u8,
        content_type: []const u8,
        cond: Cond,
    ) !?[]u8 {
        var res = try self.request(.PUT, key, body, content_type, .{ .cond = cond });
        defer res.deinit();
        if (res.code == 412) return Error.Precondition;
        if (res.code != 200) {
            std.log.err("zstore: PUT {s} -> {d}: {s}", .{ key, res.code, res.body.items });
            return Error.Status;
        }
        return res.takeEtag();
    }

    /// HEAD returning the current ETag, or null when the object is absent.
    pub fn headEtag(self: *Client, key: []const u8) !?[]u8 {
        var res = try self.request(.HEAD, key, null, null, .{});
        defer res.deinit();
        if (res.code == 404) return null;
        if (res.code != 200) return Error.Status;
        return res.takeEtag();
    }

    /// GET returning body plus the ETag of the object (both caller-owned).
    pub fn getWithEtag(self: *Client, key: []const u8) !?struct { body: []u8, etag: ?[]u8 } {
        var res = try self.request(.GET, key, null, null, .{});
        defer res.deinit();
        if (res.code == 404) return null;
        if (res.code != 200) return Error.Status;
        const body = try self.alloc.dupe(u8, res.body.items);
        return .{ .body = body, .etag = res.takeEtag() };
    }

    /// Full "/bucket/prefix/key" path, needed for x-amz-copy-source.
    pub fn bucketPath(self: *Client, key: []const u8, with_prefix: bool) ![]u8 {
        var path = try self.objectPath(self.alloc, key, with_prefix);
        defer path.deinit(self.alloc);
        return try self.alloc.dupe(u8, path.items);
    }

    /// Copy from an explicit "/bucket/prefix/key" source path.
    pub fn copyFromPath(self: *Client, dst_key: []const u8, src_path: []const u8) !void {
        var res = try self.request(.PUT, dst_key, null, null, .{ .copy_source = src_path });
        defer res.deinit();
        if (res.code != 200) {
            std.log.err("zstore: COPY {s} <- {s} -> {d}: {s}", .{ dst_key, src_path, res.code, res.body.items });
            return Error.Status;
        }
    }

    /// Server-side copy inside the same bucket.
    pub fn copy(self: *Client, dst_key: []const u8, src_key: []const u8) !void {
        const a = self.alloc;
        var src = try self.objectPath(a, src_key, true);
        defer src.deinit(a);
        var res = try self.request(.PUT, dst_key, null, null, .{ .copy_source = src.items });
        defer res.deinit();
        if (res.code != 200) {
            std.log.err("zstore: COPY {s} <- {s} -> {d}: {s}", .{ dst_key, src.items, res.code, res.body.items });
            return Error.Status;
        }
    }

    /// List object keys under a prefix (ListObjectsV2, paginated).
    pub fn listKeys(self: *Client, prefix: []const u8) ![][]u8 {
        const a = self.alloc;
        const full = if (self.cfg.prefix.len > 0)
            try std.fmt.allocPrint(a, "{s}/{s}", .{ self.cfg.prefix, prefix })
        else
            try a.dupe(u8, prefix);
        defer a.free(full);
        var out = std.ArrayList([]u8).empty;
        errdefer {
            for (out.items) |k| a.free(k);
            out.deinit(a);
        }
        var token: ?[]u8 = null;
        defer if (token) |t| a.free(t);
        while (true) {
            // Canonical query strings are sorted by parameter name.
            const query = if (token) |t|
                try std.fmt.allocPrint(a, "continuation-token={s}&list-type=2&max-keys=1000&prefix={s}", .{ try enc(a, t), try enc(a, full) })
            else
                try std.fmt.allocPrint(a, "list-type=2&max-keys=1000&prefix={s}", .{try enc(a, full)});
            defer a.free(query);

            var res = try self.request(.GET, "", null, null, .{ .query = query, .omit_prefix = true });
            defer res.deinit();
            if (res.code != 200) {
                std.log.err("zstore: LIST {s} -> {d}: {s}", .{ query, res.code, res.body.items });
                return Error.Status;
            }

            var i: usize = 0;
            const body = res.body.items;
            while (std.mem.indexOfPos(u8, body, i, "<Key>")) |st| {
                const start = st + 5;
                const en = std.mem.indexOfPos(u8, body, start, "</Key>") orelse break;
                try out.append(a, try a.dupe(u8, body[start..en]));
                i = en + 6;
            }
            const trunc = std.mem.indexOf(u8, body, "<IsTruncated>true</IsTruncated>") != null;
            if (!trunc) break;
            const nst = std.mem.indexOf(u8, body, "<NextContinuationToken>") orelse break;
            const nstart = nst + 24;
            const nen = std.mem.indexOfPos(u8, body, nstart, "</NextContinuationToken>") orelse break;
            if (token) |t| a.free(t);
            token = try a.dupe(u8, body[nstart..nen]);
        }
        return out.toOwnedSlice(a);
    }

    pub fn delete(self: *Client, key: []const u8) !void {
        var res = try self.request(.DELETE, key, null, null, .{});
        defer res.deinit();
        if (res.code != 204 and res.code != 200 and res.code != 404) return Error.Status;
    }

    const Method = enum { GET, HEAD, PUT, DELETE };

    const Result = struct {
        alloc: std.mem.Allocator,
        code: c_long,
        body: std.ArrayList(u8),
        etag: ?[]u8 = null,
        fn deinit(self: *Result) void {
            self.body.deinit(self.alloc);
            if (self.etag) |e| self.alloc.free(e);
        }
        fn takeEtag(self: *Result) ?[]u8 {
            const e = self.etag;
            self.etag = null; // ownership moves to the caller; deinit must not free it
            return e;
        }
    };

    const Opts = struct {
        cond: Cond = .none,
        query: []const u8 = "",
        copy_source: []const u8 = "",
        /// Bucket-level requests (ListObjects) must not carry the prefix in the path.
        omit_prefix: bool = false,
    };

    fn objectPath(self: *Client, a: std.mem.Allocator, key: []const u8, with_prefix: bool) !std.ArrayList(u8) {
        var path = std.ArrayList(u8).empty;
        try path.append(a, '/');
        try encodePath(a, &path, self.cfg.bucket);
        if (with_prefix and self.cfg.prefix.len > 0) {
            try path.append(a, '/');
            try encodePath(a, &path, self.cfg.prefix);
        }
        if (key.len > 0) {
            try path.append(a, '/');
            try encodePath(a, &path, key);
        }
        return path;
    }

    fn request(
        self: *Client,
        method: Method,
        key: []const u8,
        payload: ?[]const u8,
        content_type: ?[]const u8,
        opts: Opts,
    ) !Result {
        const a = self.alloc;
        const payload_bytes = payload orelse "";

        var payload_digest: [32]u8 = undefined;
        Sha256.hash(payload_bytes, &payload_digest, .{});
        const payload_hex = hexOf(payload_digest);

        // canonical resource path: /bucket/prefix/key (segments percent-encoded)
        var path = try self.objectPath(a, key, !opts.omit_prefix);
        defer path.deinit(a);

        const host = hostOf(self.cfg.endpoint);
        const now = std.time.epoch.EpochSeconds{ .secs = @intCast(nowSecs()) };
        const stamp = amzStamp(now);

        // Conditional / copy headers are part of the request, so they must
        // also be signed: RustFS (like AWS) rejects unsigned headers.
        var ch = std.ArrayList(u8).empty;
        defer ch.deinit(a);
        try ch.appendSlice(a, try std.fmt.allocPrint(a, "host:{s}\n", .{host}));
        try ch.appendSlice(a, try std.fmt.allocPrint(a, "x-amz-content-sha256:{s}\n", .{&payload_hex}));
        try ch.appendSlice(a, try std.fmt.allocPrint(a, "x-amz-date:{s}\n", .{&stamp.full}));
        var names = std.ArrayList(u8).empty;
        defer names.deinit(a);
        try names.appendSlice(a, SignedHeaders);
        switch (opts.cond) {
            .none => {},
            .if_absent => {
                try ch.appendSlice(a, "if-none-match:*\n");
                try names.appendSlice(a, ";if-none-match");
            },
            .if_match => |e| {
                try ch.appendSlice(a, try std.fmt.allocPrint(a, "if-match:\"{s}\"\n", .{e}));
                try names.appendSlice(a, ";if-match");
            },
        }
        if (opts.copy_source.len > 0) {
            try ch.appendSlice(a, try std.fmt.allocPrint(a, "x-amz-copy-source:{s}\n", .{opts.copy_source}));
            try names.appendSlice(a, ";x-amz-copy-source");
        }
        const canonical_headers = ch.items;
        const signed_headers = names.items;

        const canonical_request = try std.fmt.allocPrint(
            a,
            "{s}\n{s}\n{s}\n{s}\n{s}\n{s}",
            .{ @tagName(method), path.items, opts.query, canonical_headers, signed_headers, &payload_hex },
        );
        defer a.free(canonical_request);

        var cr_digest: [32]u8 = undefined;
        Sha256.hash(canonical_request, &cr_digest, .{});
        const cr_hex = hexOf(cr_digest);

        const scope = try std.fmt.allocPrint(a, "{s}/{s}/s3/aws4_request", .{ &stamp.ymd, self.cfg.region });
        defer a.free(scope);

        const string_to_sign = try std.fmt.allocPrint(
            a,
            "AWS4-HMAC-SHA256\n{s}\n{s}\n{s}",
            .{ &stamp.full, scope, &cr_hex },
        );
        defer a.free(string_to_sign);

        const sig_hex = try self.signature(a, &stamp.ymd, string_to_sign);
        defer a.free(sig_hex);

        const auth = try std.fmt.allocPrintSentinel(
            a,
            "Authorization: AWS4-HMAC-SHA256 Credential={s}/{s}, SignedHeaders={s}, Signature={s}",
            .{ self.cfg.access_key, scope, signed_headers, sig_hex },
            0,
        );
        defer a.free(auth);

        var slist: [*c]cu.struct_curl_slist = null;
        const h_host = try std.fmt.allocPrintSentinel(a, "Host: {s}", .{host}, 0);
        defer a.free(h_host);
        const h_date = try std.fmt.allocPrintSentinel(a, "x-amz-date: {s}", .{&stamp.full}, 0);
        defer a.free(h_date);
        const h_hash = try std.fmt.allocPrintSentinel(a, "x-amz-content-sha256: {s}", .{&payload_hex}, 0);
        defer a.free(h_hash);
        slist = cu.curl_slist_append(slist, h_host.ptr);
        slist = cu.curl_slist_append(slist, h_date.ptr);
        slist = cu.curl_slist_append(slist, h_hash.ptr);
        slist = cu.curl_slist_append(slist, auth.ptr);
        if (content_type) |ct| {
            const h_ct = try std.fmt.allocPrintSentinel(a, "Content-Type: {s}", .{ct}, 0);
            defer a.free(h_ct);
            slist = cu.curl_slist_append(slist, h_ct.ptr);
        }
        switch (opts.cond) {
            .none => {},
            .if_absent => slist = cu.curl_slist_append(slist, "If-None-Match: *"),
            .if_match => |e| {
                const h = try std.fmt.allocPrintSentinel(a, "If-Match: \"{s}\"", .{e}, 0);
                defer a.free(h);
                slist = cu.curl_slist_append(slist, h.ptr);
            },
        }
        if (opts.copy_source.len > 0) {
            const h = try std.fmt.allocPrintSentinel(a, "x-amz-copy-source: {s}", .{opts.copy_source}, 0);
            defer a.free(h);
            slist = cu.curl_slist_append(slist, h.ptr);
        }
        defer cu.curl_slist_free_all(slist);

        const url = if (opts.query.len > 0)
            try std.fmt.allocPrintSentinel(a, "{s}{s}?{s}", .{ self.cfg.endpoint, path.items, opts.query }, 0)
        else
            try std.fmt.allocPrintSentinel(a, "{s}{s}", .{ self.cfg.endpoint, path.items }, 0);
        defer a.free(url);

        var resp = Response{ .alloc = a };

        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_URL, url.ptr);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_HTTPHEADER, slist);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_WRITEFUNCTION, &writeCb);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_WRITEDATA, &resp);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_HEADERFUNCTION, &headerCb);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_HEADERDATA, &resp);
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_NOSIGNAL, @as(c_long, 1));
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_TIMEOUT, @as(c_long, 60));
        if (self.cfg.insecure_tls) {
            _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_SSL_VERIFYPEER, @as(c_long, 0));
            _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_SSL_VERIFYHOST, @as(c_long, 0));
        }

        // The handle is reused for every request, so clear the method- and
        // body-related options first; stale CUSTOMREQUEST/POSTFIELDS would
        // otherwise turn the next GET into another PUT.
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_CUSTOMREQUEST, @as(?*const anyopaque, null));
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_POSTFIELDS, @as(?*const anyopaque, null));
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_POSTFIELDSIZE, @as(c_long, -1));
        _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_NOBODY, @as(c_long, 0));
        switch (method) {
            .GET => {
                // reset the handle out of POST/PUT mode
                _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_HTTPGET, @as(c_long, 1));
            },
            .HEAD => _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_NOBODY, @as(c_long, 1)),
            .DELETE => _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_CUSTOMREQUEST, "DELETE"),
            .PUT => {
                _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_POSTFIELDS, @as(?*const anyopaque, @ptrCast(payload_bytes.ptr)));
                _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_POSTFIELDSIZE, @as(c_long, @intCast(payload_bytes.len)));
                _ = cu.curl_easy_setopt(self.curl, cu.CURLOPT_CUSTOMREQUEST, "PUT");
            },
        }

        const rc = cu.curl_easy_perform(self.curl);
        if (rc != 0) {
            std.log.err("zstore: curl {s} {s}: {s}", .{ @tagName(method), url, cu.curl_easy_strerror(rc) });
            return Error.Request;
        }
        var code: c_long = 0;
        _ = cu.curl_easy_getinfo(self.curl, cu.CURLINFO_RESPONSE_CODE, &code);
        return .{ .alloc = a, .code = code, .body = resp.body, .etag = resp.etag };
    }

    fn signature(self: *Client, a: std.mem.Allocator, ymd: *const [8]u8, string_to_sign: []const u8) ![]u8 {
        var seed_buf: [64]u8 = undefined;
        const seed = try std.fmt.bufPrint(&seed_buf, "AWS4{s}", .{self.cfg.secret_key});

        var k_date: [32]u8 = undefined;
        HmacSha256.create(&k_date, ymd, seed);
        var k_region: [32]u8 = undefined;
        HmacSha256.create(&k_region, self.cfg.region, &k_date);
        var k_service: [32]u8 = undefined;
        HmacSha256.create(&k_service, "s3", &k_region);
        var k_signing: [32]u8 = undefined;
        HmacSha256.create(&k_signing, "aws4_request", &k_service);
        var sig: [32]u8 = undefined;
        HmacSha256.create(&sig, string_to_sign, &k_signing);

        const hex = hexOf(sig);
        return try a.dupe(u8, &hex);
    }
};

fn hexOf(digest: [32]u8) [64]u8 {
    return std.fmt.bytesToHex(digest, .lower);
}

const AmzStamp = struct {
    ymd: [8]u8,
    full: [16]u8,
};

fn amzStamp(es: std.time.epoch.EpochSeconds) AmzStamp {
    const day = es.getEpochDay();
    const yd = day.calculateYearDay();
    const md = yd.calculateMonthDay();
    const ds = es.getDaySeconds();

    var out: AmzStamp = .{ .ymd = undefined, .full = undefined };
    _ = std.fmt.bufPrint(&out.ymd, "{d:0>4}{d:0>2}{d:0>2}", .{
        yd.year,
        md.month.numeric(),
        md.day_index + 1,
    }) catch unreachable;
    _ = std.fmt.bufPrint(&out.full, "{s}T{d:0>2}{d:0>2}{d:0>2}Z", .{
        &out.ymd,
        ds.getHoursIntoDay(),
        ds.getMinutesIntoHour(),
        ds.getSecondsIntoMinute(),
    }) catch unreachable;
    return out;
}

fn hostOf(endpoint: []const u8) []const u8 {
    var rest = endpoint;
    if (std.mem.indexOf(u8, rest, "://")) |i| rest = rest[i + 3 ..];
    if (std.mem.indexOfScalar(u8, rest, '/')) |i| rest = rest[0..i];
    return rest;
}

fn enc(a: std.mem.Allocator, s: []const u8) ![]u8 {
    var out = std.ArrayList(u8).empty;
    errdefer out.deinit(a);
    for (s) |ch| {
        if (isUnreserved(ch)) {
            try out.append(a, ch);
        } else {
            var buf: [3]u8 = undefined;
            _ = std.fmt.bufPrint(&buf, "%{X:0>2}", .{ch}) catch unreachable;
            try out.appendSlice(a, &buf);
        }
    }
    return out.toOwnedSlice(a);
}

fn isUnreserved(ch: u8) bool {
    return std.ascii.isAlphanumeric(ch) or ch == '-' or ch == '_' or ch == '.' or ch == '~';
}

fn encodePath(a: std.mem.Allocator, out: *std.ArrayList(u8), s: []const u8) !void {
    for (s) |ch| {
        if (isUnreserved(ch) or ch == '/') {
            try out.append(a, ch);
        } else {
            var hexbuf: [3]u8 = undefined;
            _ = std.fmt.bufPrint(&hexbuf, "%{X:0>2}", .{ch}) catch unreachable;
            try out.appendSlice(a, &hexbuf);
        }
    }
}

test "sigv4 canonical path encoding" {
    const a = std.testing.allocator;
    var buf = std.ArrayList(u8).empty;
    defer buf.deinit(a);
    try encodePath(a, &buf, "revs/42.json");
    try std.testing.expectEqualStrings("revs/42.json", buf.items);
}
