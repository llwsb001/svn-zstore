//! svn_fs backend: revision data lives in an S3-compatible object store.
const std = @import("std");
const c = @import("svn_bindings.zig");
const s3 = @import("s3.zig");
const store = @import("store.zig");
pub const backend = @import("backend.zig");

const gpa = std.heap.c_allocator;

const REPO_FORMAT: []const u8 = "1";
const FS_TYPE: []const u8 = "zstore";

extern "c" fn write(fd: c_int, buf: [*c]const u8, n: usize) isize;

pub fn logf(comptime fmt: []const u8, args: anytype) void {
    var buf: [1024]u8 = undefined;
    const msg = std.fmt.bufPrint(&buf, "zstore: " ++ fmt ++ "\n", args) catch return;
    _ = write(2, msg.ptr, msg.len);
}

pub fn err(code: c_int, comptime fmt: []const u8, args: anytype) [*c]c.svn_error_t {
    var buf: [512]u8 = undefined;
    const msg = std.fmt.bufPrintSentinel(&buf, fmt, args, 0) catch return c.svn_error_createf(code, null, "zstore error");
    return c.svn_error_createf(code, null, "%s", msg.ptr);
}

pub fn noError() [*c]c.svn_error_t {
    return null;
}

// ---------------------------------------------------------------------------
// per-repository state hanging off svn_fs_t.fsap_data
// ---------------------------------------------------------------------------
pub const ZStore = struct {
    pool: ?*c.apr_pool_t,
    client: s3.Client,
    uuid: []const u8,
    repo_path: []const u8,
    /// process-local cache of the youngest revision (-1 = not loaded yet)
    youngest: i64 = -1,

    pub fn from(fs: [*c]c.svn_fs_t) *ZStore {
        return @ptrCast(@alignCast(fs.*.fsap_data.?));
    }
};

pub fn dupFromPool(pool: ?*c.apr_pool_t, s: []const u8) []const u8 {
    const mem = c.apr_palloc(pool, s.len + 1) orelse return "";
    const out: [*]u8 = @ptrCast(mem);
    @memcpy(out[0..s.len], s);
    out[s.len] = 0;
    return out[0..s.len];
}

extern "c" fn fopen(path: [*c]const u8, mode: [*c]const u8) ?*anyopaque;
extern "c" fn fclose(f: ?*anyopaque) c_int;
extern "c" fn fread(ptr: ?*anyopaque, size: usize, nmemb: usize, f: ?*anyopaque) usize;
extern "c" fn fwrite(ptr: ?*const anyopaque, size: usize, nmemb: usize, f: ?*anyopaque) usize;
extern "c" fn fseek(f: ?*anyopaque, off: c_long, whence: c_int) c_int;
extern "c" fn ftell(f: ?*anyopaque) c_long;

fn fileExists(path: []const u8) bool {
    var zbuf: [1024]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&zbuf, "{s}", .{path}, 0) catch return false;
    const f = fopen(z.ptr, "rb") orelse return false;
    _ = fclose(f);
    return true;
}

fn readFileAlloc(path: []const u8) ![]u8 {
    var zbuf: [1024]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&zbuf, "{s}", .{path}, 0) catch return error.OutOfMemory;
    const f = fopen(z.ptr, "rb") orelse return error.FileNotFound;
    defer _ = fclose(f);
    if (fseek(f, 0, 2) != 0) return error.Unexpected;
    const size = ftell(f);
    if (size < 0) return error.Unexpected;
    if (fseek(f, 0, 0) != 0) return error.Unexpected;
    const buf = try gpa.alloc(u8, @intCast(size));
    errdefer gpa.free(buf);
    if (size > 0) {
        const n = fread(buf.ptr, 1, buf.len, f);
        if (n != buf.len) return error.Unexpected;
    }
    return buf;
}

fn writeFile(path: []const u8, data: []const u8) !void {
    var zbuf: [1024]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&zbuf, "{s}", .{path}, 0) catch return error.OutOfMemory;
    const f = fopen(z.ptr, "wb") orelse return error.AccessDenied;
    defer _ = fclose(f);
    if (data.len > 0 and fwrite(data.ptr, 1, data.len, f) != data.len) return error.NoSpaceLeft;
}

fn makePath(path: []const u8) !void {
    const pool = c.svn_pool_create_ex(null, null);
    defer c.svn_pool_destroy(pool);
    var zbuf: [1024]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&zbuf, "{s}", .{path}, 0) catch return error.OutOfMemory;
    if (c.apr_dir_make_recursive(z.ptr, 0o777, pool) != 0) return error.AccessDenied;
}

fn removeTree(path: []const u8) !void {
    const pool = c.svn_pool_create_ex(null, null);
    defer c.svn_pool_destroy(pool);
    var zbuf: [1024]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&zbuf, "{s}", .{path}, 0) catch return error.OutOfMemory;
    return removeRec(pool, z.ptr);
}

fn removeRec(pool: ?*c.apr_pool_t, path: [*c]const u8) !void {
    var dir: ?*c.apr_dir_t = null;
    if (c.apr_dir_open(&dir, path, pool) != 0) {
        _ = c.apr_file_remove(path, pool);
        return;
    }
    defer _ = c.apr_dir_close(dir);
    var fi: c.apr_finfo_t = std.mem.zeroes(c.apr_finfo_t);
    while (c.apr_dir_read(&fi, c.APR_FINFO_NAME | 0x00000010, dir) == 0) {
        const name = fi.fname;
        if (name == null) break;
        const n = std.mem.span(name);
        if (std.mem.eql(u8, n, ".") or std.mem.eql(u8, n, "..")) continue;
        const plen = std.mem.len(@as([*:0]const u8, @ptrCast(path)));
        var cbuf: [1200]u8 = undefined;
        const cz = std.fmt.bufPrintSentinel(&cbuf, "{s}/{s}", .{ path[0..plen], n }, 0) catch return error.OutOfMemory;
        try removeRec(pool, cz.ptr);
    }
    _ = c.apr_dir_remove(path, pool);
}

pub fn joinPath(a: std.mem.Allocator, parts: []const []const u8) ![]u8 {
    var buf = std.ArrayList(u8).empty;
    errdefer buf.deinit(a);
    for (parts, 0..) |p, i| {
        if (i > 0 and buf.items.len > 0 and buf.items[buf.items.len - 1] != '/') {
            try buf.append(a, '/');
        }
        try buf.appendSlice(a, p);
    }
    return buf.toOwnedSlice(a);
}

// ---------------------------------------------------------------------------
// repository config: db/zstore.conf  (key = value, '#' comments)
// ---------------------------------------------------------------------------
const RepoConf = struct {
    endpoint: []const u8 = "http://127.0.0.1:9000",
    region: []const u8 = "us-east-1",
    bucket: []const u8 = "svn",
    access_key: []const u8 = "zstore",
    secret_key: []const u8 = "zstore",
    prefix: []const u8 = "",
};

fn defaultConfText() []const u8 {
    return "# zstore repository configuration\n" ++
        "# every key also reads from the environment: ZSTORE_<KEY upper case>\n" ++
        "endpoint = http://127.0.0.1:9000\n" ++
        "region   = us-east-1\n" ++
        "bucket   = svn\n" ++
        "access_key = zstore\n" ++
        "secret_key = zstore\n" ++
        "# prefix   = repos/demo     # defaults to the repository uuid\n";
}

fn envOr(key: []const u8, fallback: []const u8) []const u8 {
    // getenv through libc keeps this independent of std.Process changes.
    var name_buf: [64]u8 = undefined;
    const name = std.fmt.bufPrint(&name_buf, "ZSTORE_{s}", .{key}) catch return fallback;
    const v = getenvZ(name) orelse return fallback;
    return v;
}

fn getenvZ(name: []const u8) ?[]const u8 {
    var buf: [64]u8 = undefined;
    const z = std.fmt.bufPrintSentinel(&buf, "{s}", .{name}, 0) catch return null;
    const val = cgetenv(z.ptr) orelse return null;
    if (val.len == 0) return null;
    return val;
}

extern "c" fn getenv(name: [*c]const u8) [*c]u8;
fn cgetenv(name: [*c]const u8) ?[]const u8 {
    const p = getenv(name);
    if (p == null) return null;
    var i: usize = 0;
    while (p[i] != 0) : (i += 1) {}
    return p[0..i];
}

fn loadConf(a: std.mem.Allocator, db_path: []const u8) !RepoConf {
    var conf = RepoConf{
        .endpoint = envOr("ENDPOINT", "http://127.0.0.1:9000"),
        .region = envOr("REGION", "us-east-1"),
        .bucket = envOr("BUCKET", "svn"),
        .access_key = envOr("ACCESS_KEY", "zstore"),
        .secret_key = envOr("SECRET_KEY", "zstore"),
        .prefix = envOr("PREFIX", ""),
    };
    _ = a;
    const path = try joinPath(gpa, &.{ db_path, "zstore.conf" });
    defer gpa.free(path);
    // The parsed values point straight into this buffer, so it has to outlive
    // the configuration (one small allocation per repository handle).
    const text = readFileAlloc(path) catch return conf;
    var it = std.mem.splitScalar(u8, text, '\n');
    while (it.next()) |raw| {
        const line = std.mem.trim(u8, raw, " \t\r");
        if (line.len == 0 or line[0] == '#') continue;
        const eq = std.mem.indexOfScalar(u8, line, '=') orelse continue;
        const key = std.mem.trim(u8, line[0..eq], " \t");
        const val = std.mem.trim(u8, line[eq + 1 ..], " \t");
        if (std.mem.eql(u8, key, "endpoint")) conf.endpoint = val;
        if (std.mem.eql(u8, key, "region")) conf.region = val;
        if (std.mem.eql(u8, key, "bucket")) conf.bucket = val;
        if (std.mem.eql(u8, key, "access_key")) conf.access_key = val;
        if (std.mem.eql(u8, key, "secret_key")) conf.secret_key = val;
        if (std.mem.eql(u8, key, "prefix")) conf.prefix = val;
    }
    return conf;
}

fn newUuid(a: std.mem.Allocator) ![]u8 {
    var raw: [16]u8 = undefined;
    {
        const f = fopen("/dev/urandom", "rb") orelse return error.OutOfMemory;
        defer _ = fclose(f);
        const n = fread(&raw, 1, raw.len, f);
        if (n != raw.len) return error.OutOfMemory;
    }
    raw[6] = (raw[6] & 0x0f) | 0x40;
    raw[8] = (raw[8] & 0x3f) | 0x80;
    return std.fmt.allocPrint(a, "{x:0>2}{x:0>2}{x:0>2}{x:0>2}-{x:0>2}{x:0>2}-{x:0>2}{x:0>2}-{x:0>2}{x:0>2}-{x:0>2}{x:0>2}{x:0>2}{x:0>2}{x:0>2}{x:0>2}", .{
        raw[0], raw[1], raw[2], raw[3], raw[4],  raw[5],
        raw[6], raw[7], raw[8], raw[9], raw[10], raw[11],
        raw[12], raw[13], raw[14], raw[15],
    });
}

fn openZStore(fs: [*c]c.svn_fs_t, path: [*c]const u8, scratch_pool: ?*c.apr_pool_t) [*c]c.svn_error_t {
    _ = scratch_pool;
    const db_path = std.mem.span(path);
    // The loader does not populate fs->path; several svnadmin commands
    // (verify, recover, hotcopy) read it back and would dereference NULL.
    fs.*.path = @constCast(dupFromPool(fs.*.pool, db_path).ptr);

    const conf = loadConf(gpa, db_path) catch RepoConf{};
    const prefix = if (conf.prefix.len > 0) conf.prefix else blk: {
        const uuid_path = joinPath(gpa, &.{ db_path, "uuid" }) catch break :blk "";
        defer if (uuid_path.len > 0) gpa.free(uuid_path);
        // kept alive: the S3 client keeps slices into this buffer
        const t = readFileAlloc(uuid_path) catch break :blk "";
        break :blk std.mem.trim(u8, t, " \t\r\n");
    };

    const zs = gpa.create(ZStore) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    zs.* = .{
        .pool = fs.*.pool,
        .client = s3.Client.init(gpa, .{
            .endpoint = conf.endpoint,
            .region = conf.region,
            .bucket = conf.bucket,
            .access_key = conf.access_key,
            .secret_key = conf.secret_key,
            .prefix = prefix,
        }) catch return err(c.SVN_ERR_FS_GENERAL, "cannot initialise S3 client", .{}),
        .uuid = dupFromPool(fs.*.pool, prefix),
        .repo_path = dupFromPool(fs.*.pool, db_path),
        .youngest = -1,
    };
    fs.*.fsap_data = zs;
    fs.*.vtable = backend.fsVtable();
    if (std.mem.startsWith(u8, prefix, "@")) {} else {}
    fs.*.uuid = zs.uuid.ptr;

    // make sure the object-store layout exists
    store.ensureLayout(&zs.client) catch |e| {
        logf("cannot reach object store at {s}/{s}: {s}", .{ conf.endpoint, conf.bucket, @errorName(e) });
        return err(c.SVN_ERR_FS_GENERAL, "cannot reach object store {s}/{s}", .{ conf.endpoint, conf.bucket });
    };

    return noError();
}

// ---------------------------------------------------------------------------
// library vtable entry points
// ---------------------------------------------------------------------------
fn fsVersion() callconv(.c) [*c]const c.svn_version_t {
    return c.svn_fs_version();
}

fn fsCreate(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    common_pool_lock: ?*c.svn_mutex__t,
    scratch_pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = common_pool_lock;
    _ = common_pool;
    _ = fs;
    _ = scratch_pool;
    const repo_path = std.mem.span(path);
    const db_path = repo_path;

    makePath(db_path) catch return err(c.SVN_ERR_FS_GENERAL, "cannot create {s}", .{db_path});

    const f1 = joinPath(gpa, &.{ db_path, "format" }) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(f1);
    writeFile(f1, REPO_FORMAT ++ "\n") catch return err(c.SVN_ERR_FS_GENERAL, "cannot write format", .{});

    const f2 = joinPath(gpa, &.{ db_path, "fs-type" }) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(f2);
    writeFile(f2, FS_TYPE ++ "\n") catch return err(c.SVN_ERR_FS_GENERAL, "cannot write fs-type", .{});

    const uuid = newUuid(gpa) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(uuid);
    const f3 = joinPath(gpa, &.{ db_path, "uuid" }) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(f3);
    writeFile(f3, uuid) catch return err(c.SVN_ERR_FS_GENERAL, "cannot write uuid", .{});

    const f4 = joinPath(gpa, &.{ db_path, "zstore.conf" }) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(f4);
    writeFile(f4, defaultConfText()) catch return err(c.SVN_ERR_FS_GENERAL, "cannot write config", .{});

    logf("created repository at {s} (uuid {s})", .{ repo_path, uuid });
    return noError();
}

fn fsOpen(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    common_pool_lock: ?*c.svn_mutex__t,
    scratch_pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = common_pool_lock;
    _ = common_pool;
    return openZStore(fs, path, scratch_pool);
}

fn fsOpenForRecovery(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    common_pool_lock: ?*c.svn_mutex__t,
    pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = common_pool_lock;
    _ = common_pool;
    return openZStore(fs, path, pool);
}

fn fsGetDescription() callconv(.c) [*c]const u8 {
    return "revisions stored in an S3-compatible object store";
}

fn fsUpgrade(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    notify_func: c.svn_fs_upgrade_notify_t,
    notify_baton: ?*anyopaque,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    common_pool_lock: ?*c.svn_mutex__t,
    scratch_pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs;
    _ = path;
    _ = notify_func;
    _ = notify_baton;
    _ = cancel_func;
    _ = cancel_baton;
    _ = common_pool_lock;
    _ = scratch_pool;
    _ = common_pool;
    return noError();
}

fn fsVerify(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    start: c.svn_revnum_t,
    end: c.svn_revnum_t,
    notify_func: c.svn_fs_progress_notify_func_t,
    notify_baton: ?*anyopaque,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    common_pool_lock: ?*c.svn_mutex__t,
    pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs;
    _ = path;
    _ = start;
    _ = end;
    _ = notify_func;
    _ = notify_baton;
    _ = cancel_func;
    _ = cancel_baton;
    _ = common_pool_lock;
    _ = pool;
    _ = common_pool;
    return noError();
}

fn fsDeleteFs(path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const repo_path = std.mem.span(path);
    removeTree(repo_path) catch return err(c.SVN_ERR_FS_GENERAL, "cannot delete {s}", .{repo_path});
    return noError();
}

fn fsHotcopy(
    src_fs: [*c]c.svn_fs_t,
    dst_fs: [*c]c.svn_fs_t,
    src_path: [*c]const u8,
    dst_path: [*c]const u8,
    clean: c.svn_boolean_t,
    incremental: c.svn_boolean_t,
    notify_func: c.svn_fs_hotcopy_notify_t,
    notify_baton: ?*anyopaque,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    common_pool_lock: ?*c.svn_mutex__t,
    pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = src_fs;
    _ = dst_fs;
    _ = src_path;
    _ = dst_path;
    _ = clean;
    _ = incremental;
    _ = notify_func;
    _ = notify_baton;
    _ = cancel_func;
    _ = cancel_baton;
    _ = common_pool_lock;
    _ = pool;
    _ = common_pool;
    return err(c.SVN_ERR_FS_UNSUPPORTED_FORMAT, "hotcopy is not supported by the zstore backend", .{});
}

fn fsRecover(
    fs: [*c]c.svn_fs_t,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs;
    _ = cancel_func;
    _ = cancel_baton;
    _ = pool;
    return noError();
}

fn fsPack(
    fs: [*c]c.svn_fs_t,
    path: [*c]const u8,
    notify_func: c.svn_fs_pack_notify_t,
    notify_baton: ?*anyopaque,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    common_pool_lock: ?*c.svn_mutex__t,
    pool: ?*c.apr_pool_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs;
    _ = path;
    _ = notify_func;
    _ = notify_baton;
    _ = cancel_func;
    _ = cancel_baton;
    _ = common_pool_lock;
    _ = pool;
    _ = common_pool;
    return noError();
}

fn fsLogfiles(logfiles: [*c][*c]c.apr_array_header_t, path: [*c]const u8, only_unused: c.svn_boolean_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = logfiles;
    _ = path;
    _ = only_unused;
    _ = pool;
    return noError();
}

fn fsSetSvnFsOpen(
    fs: [*c]c.svn_fs_t,
    svn_fs_open_: ?*const fn ([*c][*c]c.svn_fs_t, [*c]const u8, ?*c.apr_hash_t, ?*c.apr_pool_t, ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs;
    _ = svn_fs_open_;
    return noError();
}

fn fsInfoDup(info: ?*const anyopaque, result_pool: ?*c.apr_pool_t) callconv(.c) ?*anyopaque {
    _ = result_pool;
    return @constCast(info);
}

fn fsBdbLogfiles(logfiles: [*c][*c]c.apr_array_header_t, path: [*c]const u8, only_unused: c.svn_boolean_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = logfiles;
    _ = path;
    _ = only_unused;
    _ = pool;
    return noError();
}

fn fsParseId(data: [*c]const u8, len: c.apr_size_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_fs_id_t {
    _ = data;
    _ = len;
    _ = pool;
    return null;
}

var library_vtable = c.fs_library_vtable_t{
    .get_version = &fsVersion,
    .create = &fsCreate,
    .open_fs = &fsOpen,
    .open_fs_for_recovery = &fsOpenForRecovery,
    .upgrade_fs = &fsUpgrade,
    .verify_fs = &fsVerify,
    .delete_fs = &fsDeleteFs,
    .hotcopy = &fsHotcopy,
    .get_description = &fsGetDescription,
    .recover = &fsRecover,
    .pack_fs = &fsPack,
    .bdb_logfiles = &fsBdbLogfiles,
    .parse_id = &fsParseId,
    .set_svn_fs_open = &fsSetSvnFsOpen,
    .info_fsap_dup = &fsInfoDup,
};

export fn svn_fs_zstore__init(
    loader_version: [*c]const c.svn_version_t,
    vtable: [*c][*c]c.fs_library_vtable_t,
    common_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = common_pool;
    if (loader_version.*.major != c.svn_fs_version().*.major) {
        return err(c.SVN_ERR_VERSION_MISMATCH, "unsupported FS loader version {d}", .{loader_version.*.major});
    }
    vtable.* = &library_vtable;
    return noError();
}
