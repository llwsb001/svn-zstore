//! Object model for zstore.
//!
//! Everything is content-addressed so that a new revision only uploads the
//! directories (trees) and files (blobs) it actually changed:
//!
//!   format                 marker object
//!   HEAD                   "rev=<n>\nroot=<tree sha>\n"  (single mutable object)
//!   revs/<n>               revision record: parent, root tree, revprop blob
//!   trees/<sha256>         one directory listing
//!   blobs/<sha256>         file contents or serialised properties
//!
//! A tree object is a length-prefixed binary listing; snapshots are immutable,
//! so concurrent readers never see a half-written revision.
const std = @import("std");
const s3 = @import("s3.zig");

pub const Error = error{
    CorruptObject,
    NotFound,
    OutOfMemory,
    Status,
    Request,
};

pub const Kind = enum(u8) { dir = 0, file = 1 };

pub const Entry = struct {
    name: []const u8,
    kind: Kind = .file,
    /// sha256 (64 hex chars) of the tree object or the blob object
    key: []const u8 = "",
    size: i64 = 0,
    created_rev: i64 = -1,
    created_path: []const u8 = "",
    /// serialised property blob (empty when the node has no properties)
    props: []const u8 = "",
    copyfrom_rev: i64 = -1,
    copyfrom_path: []const u8 = "",
};

/// A directory listing. Entries stay sorted by name (svn requires stable
/// ordering and our binary search relies on it).
pub const Tree = struct {
    entries: std.ArrayList(Entry) = .empty,
    dirty: bool = false,
    /// sha256 of this tree object once it exists in the store
    key: []const u8 = "",
    /// directory path this tree was loaded for (debugging / flush)
    path: []const u8 = "",

    pub fn deinit(self: *Tree, a: std.mem.Allocator) void {
        self.entries.deinit(a);
    }

    pub fn find(self: *const Tree, name: []const u8) ?*const Entry {
        var lo: usize = 0;
        var hi: usize = self.entries.items.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            const e = &self.entries.items[mid];
            switch (std.mem.order(u8, e.name, name)) {
                .lt => lo = mid + 1,
                .gt => hi = mid,
                .eq => return e,
            }
        }
        return null;
    }

    pub fn findIndex(self: *const Tree, name: []const u8) ?usize {
        var lo: usize = 0;
        var hi: usize = self.entries.items.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            switch (std.mem.order(u8, self.entries.items[mid].name, name)) {
                .lt => lo = mid + 1,
                .gt => hi = mid,
                .eq => return mid,
            }
        }
        return null;
    }

    pub fn findMut(self: *Tree, name: []const u8) ?*Entry {
        var lo: usize = 0;
        var hi: usize = self.entries.items.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            const e = &self.entries.items[mid];
            switch (std.mem.order(u8, e.name, name)) {
                .lt => lo = mid + 1,
                .gt => hi = mid,
                .eq => return e,
            }
        }
        return null;
    }

    pub fn insert(self: *Tree, a: std.mem.Allocator, entry: Entry) !void {
        var lo: usize = 0;
        var hi: usize = self.entries.items.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            switch (std.mem.order(u8, self.entries.items[mid].name, entry.name)) {
                .lt => lo = mid + 1,
                .gt => hi = mid,
                .eq => {
                    self.entries.items[mid] = entry;
                    self.dirty = true;
                    return;
                },
            }
        }
        try self.entries.insert(a, lo, entry);
        self.dirty = true;
    }

    pub fn remove(self: *Tree, name: []const u8) bool {
        var lo: usize = 0;
        var hi: usize = self.entries.items.len;
        while (lo < hi) {
            const mid = lo + (hi - lo) / 2;
            switch (std.mem.order(u8, self.entries.items[mid].name, name)) {
                .lt => lo = mid + 1,
                .gt => hi = mid,
                .eq => {
                    _ = self.entries.orderedRemove(mid);
                    self.dirty = true;
                    return true;
                },
            }
        }
        return false;
    }
};

pub const Rev = struct {
    rev: i64,
    parent: i64 = -1,
    root: []const u8,
    props: []const u8 = "",
};

pub const Head = struct {
    rev: i64 = -1,
    root: []const u8 = "",
};

// ---------------------------------------------------------------------------
// properties blob: u32 count, then (u32 len, name, u32 len, value)*
// ---------------------------------------------------------------------------
pub const Prop = struct { name: []const u8, value: []const u8 };

pub fn encodeProps(a: std.mem.Allocator, props: []const Prop) ![]u8 {
    var buf = std.ArrayList(u8).empty;
    errdefer buf.deinit(a);
    try putU32(a, &buf, @intCast(props.len));
    for (props) |p| {
        try putStr(a, &buf, p.name);
        try putStr(a, &buf, p.value);
    }
    return buf.toOwnedSlice(a);
}

pub fn decodeProps(a: std.mem.Allocator, bytes: []const u8) ![]Prop {
    var out = std.ArrayList(Prop).empty;
    errdefer out.deinit(a);
    if (bytes.len == 0) return out.toOwnedSlice(a);
    var cur = Reader{ .buf = bytes };
    const n = try cur.u32v();
    var i: usize = 0;
    while (i < n) : (i += 1) {
        // NUL-terminated: these slices end up as apr_hash keys and as C
        // strings (svnadmin dump prints them with %s).
        const name = try dupSentinel(a, try cur.str());
        const value = try dupSentinel(a, try cur.str());
        try out.append(a, .{ .name = name, .value = value });
    }
    return out.toOwnedSlice(a);
}

fn dupSentinel(a: std.mem.Allocator, s: []const u8) ![]const u8 {
    const buf = try a.allocSentinel(u8, s.len, 0);
    @memcpy(buf[0..s.len], s);
    return buf[0..s.len];
}

pub fn propGet(props: []const u8, name: []const u8) ?[]const u8 {
    var cur = Reader{ .buf = props };
    const n = cur.u32v() catch return null;
    var i: usize = 0;
    while (i < n) : (i += 1) {
        const pn = cur.str() catch return null;
        const pv = cur.str() catch return null;
        if (std.mem.eql(u8, pn, name)) return pv;
    }
    return null;
}

// ---------------------------------------------------------------------------
// tree serialisation
// ---------------------------------------------------------------------------
pub fn deinitTree(a: std.mem.Allocator, tree: *Tree) void {
    for (tree.entries.items) |e| {
        a.free(e.name);
        a.free(e.created_path);
        a.free(e.props);
        a.free(e.copyfrom_path);
        a.free(e.key);
    }
    tree.entries.deinit(a);
    if (tree.key.len > 0) a.free(tree.key);
    if (tree.path.len > 0) a.free(tree.path);
}

pub fn encodeTree(a: std.mem.Allocator, tree: *const Tree, out: *std.ArrayList(u8)) !void {
    try out.appendSlice(a, "ZST");
    try out.append(a, 1);
    try putU32(a, out, @intCast(tree.entries.items.len));
    for (tree.entries.items) |e| {
        try putStr(a, out, e.name);
        try out.append(a, @intFromEnum(e.kind));
        try putU64(a, out, @intCast(e.size));
        try putI64(a, out, e.created_rev);
        try putStr(a, out, e.created_path);
        try putStr(a, out, e.props);
        try putI64(a, out, e.copyfrom_rev);
        try putStr(a, out, e.copyfrom_path);
        try putStr(a, out, e.key);
    }
}

pub fn decodeTree(a: std.mem.Allocator, bytes: []const u8) !Tree {
    if (bytes.len < 8 or !std.mem.eql(u8, bytes[0..3], "ZST")) return Error.CorruptObject;
    if (bytes[3] != 1) return Error.CorruptObject;
    var cur = Reader{ .buf = bytes[4..] };
    const n = try cur.u32v();
    var tree = Tree{};
    errdefer tree.deinit(a);
    try tree.entries.ensureTotalCapacity(a, n);
    var i: usize = 0;
    while (i < n) : (i += 1) {
        const name = try a.dupe(u8, try cur.str());
        const kind_byte = cur.byte() orelse return Error.CorruptObject;
        const kind: Kind = switch (kind_byte) {
            0 => .dir,
            1 => .file,
            else => return Error.CorruptObject,
        };
        const size = try cur.u64v();
        const created_rev = try cur.i64v();
        const created_path = try a.dupe(u8, try cur.str());
        const props = try a.dupe(u8, try cur.str());
        const copyfrom_rev = try cur.i64v();
        const copyfrom_path = try a.dupe(u8, try cur.str());
        const key = try a.dupe(u8, try cur.str());
        tree.entries.appendAssumeCapacity(.{
            .name = name,
            .kind = kind,
            .key = key,
            .size = @intCast(size),
            .created_rev = created_rev,
            .created_path = created_path,
            .props = props,
            .copyfrom_rev = copyfrom_rev,
            .copyfrom_path = copyfrom_path,
        });
    }
    return tree;
}

fn putU32(a: std.mem.Allocator, out: *std.ArrayList(u8), v: u32) !void {
    try out.appendSlice(a, &[_]u8{
        @truncate(v >> 24),
        @truncate(v >> 16),
        @truncate(v >> 8),
        @truncate(v),
    });
}

fn putU64(a: std.mem.Allocator, out: *std.ArrayList(u8), v: u64) !void {
    try putU32(a, out, @truncate(v >> 32));
    try putU32(a, out, @truncate(v));
}

fn putI64(a: std.mem.Allocator, out: *std.ArrayList(u8), v: i64) !void {
    try putU64(a, out, @bitCast(v));
}

fn putStr(a: std.mem.Allocator, out: *std.ArrayList(u8), s: []const u8) !void {
    try putU32(a, out, @intCast(s.len));
    try out.appendSlice(a, s);
}

const Reader = struct {
    buf: []const u8,
    pos: usize = 0,

    fn byte(self: *Reader) ?u8 {
        if (self.pos >= self.buf.len) return null;
        const b = self.buf[self.pos];
        self.pos += 1;
        return b;
    }

    fn u32v(self: *Reader) !u32 {
        if (self.pos + 4 > self.buf.len) return Error.CorruptObject;
        const v = std.mem.readInt(u32, self.buf[self.pos..][0..4], .big);
        self.pos += 4;
        return v;
    }

    fn u64v(self: *Reader) !u64 {
        const hi = try self.u32v();
        const lo = try self.u32v();
        return (@as(u64, hi) << 32) | lo;
    }

    fn i64v(self: *Reader) !i64 {
        return @bitCast(try self.u64v());
    }

    fn str(self: *Reader) ![]const u8 {
        const n = try self.u32v();
        if (self.pos + n > self.buf.len) return Error.CorruptObject;
        const s = self.buf[self.pos .. self.pos + n];
        self.pos += n;
        return s;
    }
};

// ---------------------------------------------------------------------------
// object store I/O
// ---------------------------------------------------------------------------
pub fn sha256Hex(bytes: []const u8) [64]u8 {
    var digest: [32]u8 = undefined;
    std.crypto.hash.sha2.Sha256.hash(bytes, &digest, .{});
    return std.fmt.bytesToHex(digest, .lower);
}

pub fn ensureLayout(client: *s3.Client) !void {
    const existing = try client.get("format");
    if (existing) |e| {
        std.heap.c_allocator.free(e);
        return;
    }
    try client.put("format", "zstore/1\n", "text/plain");
}

pub fn loadHead(client: *s3.Client, a: std.mem.Allocator) !Head {
    const text = try client.get("HEAD") orelse return Head{};
    defer a.free(text);
    return parseHead(a, text);
}

fn parseHead(a: std.mem.Allocator, text: []const u8) !Head {
    var head = Head{};
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |line| {
        if (std.mem.startsWith(u8, line, "rev=")) head.rev = std.fmt.parseInt(i64, line[4..], 10) catch head.rev;
        if (std.mem.startsWith(u8, line, "root=")) head.root = try a.dupe(u8, line[5..]);
    }
    return head;
}

pub fn putHead(client: *s3.Client, a: std.mem.Allocator, rev: i64, root: []const u8) !void {
    const text = try std.fmt.allocPrint(a, "rev={d}\nroot={s}\n", .{ rev, root });
    defer a.free(text);
    try client.put("HEAD", text, "text/plain");
}

pub fn putHeadCond(client: *s3.Client, a: std.mem.Allocator, rev: i64, root: []const u8, cond: s3.Cond) !?[]u8 {
    const text = try std.fmt.allocPrint(a, "rev={d}\nroot={s}\n", .{ rev, root });
    defer a.free(text);
    return client.putCond("HEAD", text, "text/plain", cond);
}

pub fn headWithEtag(client: *s3.Client, a: std.mem.Allocator) !?struct { head: Head, etag: ?[]u8 } {
    const res = try client.getWithEtag("HEAD") orelse return null;
    defer a.free(res.body);
    const head = try parseHead(a, res.body);
    return .{ .head = head, .etag = res.etag };
}

pub fn loadRev(client: *s3.Client, a: std.mem.Allocator, rev: i64) !Rev {
    const key = try std.fmt.allocPrint(a, "revs/{d}", .{rev});
    defer a.free(key);
    const text = try client.get(key) orelse return Error.NotFound;
    defer a.free(text);
    var out = Rev{ .rev = rev, .root = "" };
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |line| {
        if (std.mem.startsWith(u8, line, "rev=")) out.rev = std.fmt.parseInt(i64, line[4..], 10) catch rev;
        if (std.mem.startsWith(u8, line, "parent=")) out.parent = std.fmt.parseInt(i64, line[7..], 10) catch -1;
        if (std.mem.startsWith(u8, line, "root=")) out.root = try a.dupe(u8, line[5..]);
        if (std.mem.startsWith(u8, line, "props=")) out.props = try a.dupe(u8, line[6..]);
    }
    if (out.root.len == 0) return Error.CorruptObject;
    return out;
}

pub fn putRevCond(client: *s3.Client, a: std.mem.Allocator, rev: Rev, cond: s3.Cond) !?[]u8 {
    const key = try std.fmt.allocPrint(a, "revs/{d}", .{rev.rev});
    defer a.free(key);
    const text = try std.fmt.allocPrint(a, "rev={d}\nparent={d}\nroot={s}\nprops={s}\n", .{ rev.rev, rev.parent, rev.root, rev.props });
    defer a.free(text);
    return client.putCond(key, text, "text/plain", cond);
}

pub fn putRev(client: *s3.Client, a: std.mem.Allocator, rev: Rev) !void {
    const key = try std.fmt.allocPrint(a, "revs/{d}", .{rev.rev});
    defer a.free(key);
    const text = try std.fmt.allocPrint(a, "rev={d}\nparent={d}\nroot={s}\nprops={s}\n", .{ rev.rev, rev.parent, rev.root, rev.props });
    defer a.free(text);
    try client.put(key, text, "text/plain");
}

pub fn loadTreeByKey(client: *s3.Client, a: std.mem.Allocator, key: []const u8) !Tree {
    const full = try std.fmt.allocPrint(a, "trees/{s}", .{key});
    defer a.free(full);
    const bytes = try client.get(full) orelse return Error.NotFound;
    defer a.free(bytes);
    var tree = try decodeTree(a, bytes);
    tree.key = try a.dupe(u8, key);
    return tree;
}

pub fn putTree(client: *s3.Client, a: std.mem.Allocator, tree: *const Tree) ![]const u8 {
    var buf = std.ArrayList(u8).empty;
    defer buf.deinit(a);
    try encodeTree(a, tree, &buf);
    const sha = sha256Hex(buf.items);
    const key = try std.fmt.allocPrint(a, "trees/{s}", .{&sha});
    defer a.free(key);
    try client.put(key, buf.items, "application/octet-stream");
    return try a.dupe(u8, &sha);
}

pub fn loadBlob(client: *s3.Client, a: std.mem.Allocator, sha: []const u8) ![]u8 {
    const key = try std.fmt.allocPrint(a, "blobs/{s}", .{sha});
    defer a.free(key);
    return try client.get(key) orelse Error.NotFound;
}

pub fn putBlob(client: *s3.Client, a: std.mem.Allocator, bytes: []const u8) ![]const u8 {
    const sha = sha256Hex(bytes);
    const key = try std.fmt.allocPrint(a, "blobs/{s}", .{&sha});
    defer a.free(key);
    try client.put(key, bytes, "application/octet-stream");
    return try a.dupe(u8, &sha);
}

test "tree codec roundtrip" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    var tree = Tree{};
    defer tree.deinit(a);
    try tree.insert(a, .{
        .name = "main.c",
        .kind = .file,
        .key = "0123456789abcdef",
        .size = 42,
        .created_rev = 7,
        .created_path = "/trunk/main.c",
        .props = "",
        .copyfrom_rev = 3,
        .copyfrom_path = "/old/main.c",
    });
    try tree.insert(a, .{ .name = "trunk", .kind = .dir, .key = "deadbeef", .created_rev = 1, .created_path = "/trunk" });

    var buf = std.ArrayList(u8).empty;
    defer buf.deinit(a);
    try encodeTree(a, &tree, &buf);

    var decoded = try decodeTree(a, buf.items);
    defer decoded.deinit(a);
    try std.testing.expectEqual(@as(usize, 2), decoded.entries.items.len);
    try std.testing.expectEqualStrings("main.c", decoded.entries.items[0].name);
    try std.testing.expectEqual(Kind.file, decoded.entries.items[0].kind);
    try std.testing.expectEqual(@as(i64, 42), decoded.entries.items[0].size);
    try std.testing.expectEqualStrings("/old/main.c", decoded.entries.items[0].copyfrom_path);
    try std.testing.expectEqual(Kind.dir, decoded.entries.items[1].kind);
}

test "props codec roundtrip" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const a = arena.allocator();
    const props = [_]Prop{
        .{ .name = "svn:executable", .value = "*" },
        .{ .name = "svn:log", .value = "hello\nworld" },
    };
    const bytes = try encodeProps(a, &props);
    defer a.free(bytes);
    const back = try decodeProps(a, bytes);
    defer a.free(back);
    try std.testing.expectEqual(@as(usize, 2), back.len);
    try std.testing.expectEqualStrings("hello\nworld", back[1].value);
    try std.testing.expectEqualStrings("*", propGet(bytes, "svn:executable").?);
}


// ---------------------------------------------------------------------------
// transaction records (so an interrupted commit can be reopened)
// ---------------------------------------------------------------------------

pub const TxnRec = struct {
    id: []const u8,
    base: i64 = -1,
    root: []const u8 = "",
    props: []const u8 = "",
};

pub fn txnKey(a: std.mem.Allocator, id: []const u8) ![]u8 {
    return std.fmt.allocPrint(a, "txns/{s}", .{id});
}

pub fn putTxn(client: *s3.Client, a: std.mem.Allocator, rec: TxnRec) !void {
    const key = try txnKey(a, rec.id);
    defer a.free(key);
    const text = try std.fmt.allocPrint(a, "txn={s}\nbase={d}\nroot={s}\nprops={s}\n", .{ rec.id, rec.base, rec.root, rec.props });
    defer a.free(text);
    try client.put(key, text, "text/plain");
}

pub fn loadTxn(client: *s3.Client, a: std.mem.Allocator, id: []const u8) !TxnRec {
    const key = try txnKey(a, id);
    defer a.free(key);
    const text = try client.get(key) orelse return Error.NotFound;
    defer a.free(text);
    var out = TxnRec{ .id = try a.dupe(u8, id) };
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |line| {
        if (std.mem.startsWith(u8, line, "base=")) out.base = std.fmt.parseInt(i64, line[5..], 10) catch -1;
        if (std.mem.startsWith(u8, line, "root=")) out.root = try a.dupe(u8, line[5..]);
        if (std.mem.startsWith(u8, line, "props=")) out.props = try a.dupe(u8, line[6..]);
    }
    return out;
}

pub fn deleteTxn(client: *s3.Client, a: std.mem.Allocator, id: []const u8) !void {
    const key = try txnKey(a, id);
    defer a.free(key);
    try client.delete(key);
}

pub fn listTxnIds(client: *s3.Client, a: std.mem.Allocator) ![][]u8 {
    const keys = try client.listKeys("txns/");
    defer {
        for (keys) |k| a.free(k);
        a.free(keys);
    }
    var out = std.ArrayList([]u8).empty;
    for (keys) |k| {
        const tail = k[std.mem.lastIndexOfScalar(u8, k, '/') orelse continue ..];
        if (tail.len <= 1) continue;
        try out.append(a, try a.dupe(u8, tail[1..]));
    }
    return out.toOwnedSlice(a);
}

// ---------------------------------------------------------------------------
// locks
// ---------------------------------------------------------------------------

pub const LockRec = struct {
    path: []const u8,
    token: []const u8,
    owner: []const u8 = "",
    comment: []const u8 = "",
    created: i64 = 0,
    expires: i64 = 0,
    dav: bool = false,
};

pub fn lockKey(a: std.mem.Allocator, path: []const u8) ![]u8 {
    var d: [32]u8 = undefined;
    std.crypto.hash.sha2.Sha256.hash(path, &d, .{});
    return std.fmt.allocPrint(a, "locks/{s}", .{std.fmt.bytesToHex(d, .lower)});
}

pub fn putLock(client: *s3.Client, a: std.mem.Allocator, rec: LockRec) !void {
    const key = try lockKey(a, rec.path);
    defer a.free(key);
    const text = try std.fmt.allocPrint(a, "path={s}\ntoken={s}\nowner={s}\ncomment={s}\ncreated={d}\nexpires={d}\ndav={d}\n", .{
        rec.path, rec.token, rec.owner, rec.comment, rec.created, rec.expires, @intFromBool(rec.dav),
    });
    defer a.free(text);
    try client.put(key, text, "text/plain");
}

pub fn putLockIfAbsent(client: *s3.Client, a: std.mem.Allocator, rec: LockRec) !bool {
    const key = try lockKey(a, rec.path);
    defer a.free(key);
    const text = try std.fmt.allocPrint(a, "path={s}\ntoken={s}\nowner={s}\ncomment={s}\ncreated={d}\nexpires={d}\ndav={d}\n", .{
        rec.path, rec.token, rec.owner, rec.comment, rec.created, rec.expires, @intFromBool(rec.dav),
    });
    defer a.free(text);
    _ = client.putCond(key, text, "text/plain", .if_absent) catch |e| switch (e) {
        error.Precondition => return false,
        else => return e,
    };
    return true;
}

pub fn loadLock(client: *s3.Client, a: std.mem.Allocator, path: []const u8) !?LockRec {
    const key = try lockKey(a, path);
    defer a.free(key);
    const text = try client.get(key) orelse return null;
    defer a.free(text);
    var out = LockRec{ .path = try a.dupe(u8, path), .token = "" };
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |line| {
        if (std.mem.startsWith(u8, line, "token=")) out.token = try a.dupe(u8, line[6..]);
        if (std.mem.startsWith(u8, line, "owner=")) out.owner = try a.dupe(u8, line[6..]);
        if (std.mem.startsWith(u8, line, "comment=")) out.comment = try a.dupe(u8, line[8..]);
        if (std.mem.startsWith(u8, line, "created=")) out.created = std.fmt.parseInt(i64, line[8..], 10) catch 0;
        if (std.mem.startsWith(u8, line, "expires=")) out.expires = std.fmt.parseInt(i64, line[8..], 10) catch 0;
        if (std.mem.startsWith(u8, line, "dav=")) out.dav = line[4..].len > 0 and line[4] == '1';
    }
    return out;
}

pub fn deleteLock(client: *s3.Client, a: std.mem.Allocator, path: []const u8) !void {
    const key = try lockKey(a, path);
    defer a.free(key);
    try client.delete(key);
}


pub fn listLocks(client: *s3.Client, a: std.mem.Allocator) ![]LockRec {
    const keys = try client.listKeys("locks/");
    defer {
        for (keys) |k| a.free(k);
        a.free(keys);
    }
    var out = std.ArrayList(LockRec).empty;
    errdefer out.deinit(a);
    for (keys) |k| {
        // listKeys returns keys including the repository prefix, but get()
        // prepends that prefix itself, so strip it before reading.
        const pre = client.cfg.prefix;
        const rel = if (pre.len > 0 and std.mem.startsWith(u8, k, pre) and k.len > pre.len)
            k[pre.len + 1 ..]
        else
            k;
        const text = (try client.get(rel)) orelse continue;
        defer a.free(text);
        var rec = LockRec{ .path = "", .token = "" };
        var text_it = std.mem.splitScalar(u8, text, '\n');
        while (text_it.next()) |line| {
            if (std.mem.startsWith(u8, line, "path=")) rec.path = try a.dupe(u8, line[5..]);
            if (std.mem.startsWith(u8, line, "token=")) rec.token = try a.dupe(u8, line[6..]);
            if (std.mem.startsWith(u8, line, "owner=")) rec.owner = try a.dupe(u8, line[6..]);
            if (std.mem.startsWith(u8, line, "comment=")) rec.comment = try a.dupe(u8, line[8..]);
            if (std.mem.startsWith(u8, line, "created=")) rec.created = std.fmt.parseInt(i64, line[8..], 10) catch 0;
            if (std.mem.startsWith(u8, line, "expires=")) rec.expires = std.fmt.parseInt(i64, line[8..], 10) catch 0;
            if (std.mem.startsWith(u8, line, "dav=")) rec.dav = line[4..].len > 0 and line[4] == '1';
        }
        if (rec.path.len > 0) try out.append(a, rec);
    }
    return out.toOwnedSlice(a);
}
