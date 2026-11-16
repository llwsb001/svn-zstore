//! svn_fs vtable implementation for the zstore backend.
//!
//! Every svn filesystem object (revision roots, transactions, directories and
//! files) is mapped onto the immutable objects described in store.zig:
//!
//!   revision root  -> revs/<rev> -> root tree sha
//!   transaction    -> in-memory tree cache, flushed on commit
//!   directory      -> trees/<sha>
//!   file contents  -> blobs/<sha>
//!
//! Nothing is ever mutated in place: a commit uploads only the trees and blobs
//! it changed and finally rewrites the single HEAD object.
const std = @import("std");
const c = @import("svn_bindings.zig");
const store = @import("store.zig");
const s3 = @import("s3.zig");
const fs = @import("fs.zig");

const gpa = std.heap.c_allocator;
const err = fs.err;
const noError = fs.noError;
const logf = fs.logf;
const ZStore = fs.ZStore;

pub const SVN_INVALID_REVNUM: c.svn_revnum_t = -1;

var txn_counter: std.atomic.Value(u64) = std.atomic.Value(u64).init(0);

fn nowMicros() i64 {
    const n = txn_counter.fetchAdd(1, .monotonic);
    return @as(i64, @intCast(n));
}

// ---------------------------------------------------------------------------
// context objects
// ---------------------------------------------------------------------------
pub const Txn = struct {
    zs: *ZStore,
    id: []const u8,
    base_rev: i64,
    /// root tree of the revision this transaction started from
    root_key: []const u8,
    /// serialised revprops (svn:author, svn:date, svn:log, ...)
    props: []const u8 = "",
    dirs: std.StringHashMap(*store.Tree),
    a: std.mem.Allocator,
};

pub const Ctx = struct {
    zs: *ZStore,
    rev: i64,
    txn: ?*Txn,
    root_key: []const u8,
    /// shared map borrowed from the transaction, or null to use dirs_store
    dirs: ?*std.StringHashMap(*store.Tree) = null,
    a: std.mem.Allocator,
    dirs_store: std.StringHashMap(*store.Tree),
};

fn dmap(ctx: *Ctx) *std.StringHashMap(*store.Tree) {
    return ctx.dirs orelse &ctx.dirs_store;
}

fn ctxOf(root: [*c]c.svn_fs_root_t) *Ctx {
    return @ptrCast(@alignCast(root.*.fsap_data.?));
}

// ---------------------------------------------------------------------------
// small path helpers (every path is normalised to "/a/b")
// ---------------------------------------------------------------------------
fn normPath(a: std.mem.Allocator, path: []const u8) ![]u8 {
    var buf = std.ArrayList(u8).empty;
    errdefer buf.deinit(a);
    // Editor callbacks hand us relative paths ("trunk/a.txt") while the tree
    // cache is keyed on absolute ones ("/trunk/a.txt"): always anchor at "/".
    if (path.len == 0 or path[0] != '/') try buf.append(a, '/');
    for (path) |ch| {
        if (ch == '/') {
            if (buf.items.len == 0 or buf.items[buf.items.len - 1] != '/') {
                try buf.append(a, '/');
            }
        } else {
            try buf.append(a, ch);
        }
    }
    if (buf.items.len == 0) try buf.append(a, '/');
    while (buf.items.len > 1 and buf.items[buf.items.len - 1] == '/') buf.items.len -= 1;
    return buf.toOwnedSlice(a);
}

fn parentOf(path: []const u8) []const u8 {
    if (path.len <= 1) return "/";
    const idx = std.mem.lastIndexOfScalar(u8, path, '/') orelse return "/";
    if (idx == 0) return "/";
    return path[0..idx];
}

fn baseName(path: []const u8) []const u8 {
    if (path.len <= 1) return "";
    const idx = std.mem.lastIndexOfScalar(u8, path, '/') orelse return path;
    return path[idx + 1 ..];
}

fn dupZ(a: std.mem.Allocator, str: []const u8) ![]const u8 {
    const buf = try a.allocSentinel(u8, str.len, 0);
    @memcpy(buf[0..str.len], str);
    return buf[0..str.len];
}

fn joinChild(a: std.mem.Allocator, dir: []const u8, name: []const u8) ![]u8 {
    if (std.mem.eql(u8, dir, "/")) return std.fmt.allocPrint(a, "/{s}", .{name});
    return std.fmt.allocPrint(a, "{s}/{s}", .{ dir, name });
}

// ---------------------------------------------------------------------------
// tree access
// ---------------------------------------------------------------------------
fn cacheTree(ctx: *Ctx, key: []const u8, path: []const u8) !*store.Tree {
    const tree = try gpa.create(store.Tree);
    if (key.len == 0) {
        tree.* = .{ .key = "" };
    } else {
        tree.* = store.loadTreeByKey(&ctx.zs.client, ctx.a, key) catch |e| switch (e) {
            store.Error.NotFound => return error.NotFound,
            else => return e,
        };
    }
    tree.path = try ctx.a.dupe(u8, path);
    try dmap(ctx).put(try ctx.a.dupe(u8, path), tree);
    return tree;
}

pub fn treeAt(ctx: *Ctx, path: []const u8) !*store.Tree {
    if (dmap(ctx).get(path)) |t| return t;
    if (path.len <= 1) return cacheTree(ctx, ctx.root_key, "/");
    const parent = try treeAt(ctx, parentOf(path));
    const name = baseName(path);
    const idx = parent.findIndex(name) orelse return error.NotFound;
    const e = &parent.entries.items[idx];
    if (e.kind != .dir) return error.NotDir;
    return cacheTree(ctx, e.key, path);
}

const Loc = struct { tree: *store.Tree, idx: usize };

fn locate(ctx: *Ctx, path: []const u8) !?Loc {
    const norm = try normPath(gpa, path);
    defer gpa.free(norm);
    if (norm.len <= 1) return null;
    const parent = try treeAt(ctx, parentOf(norm));
    const idx = parent.findIndex(baseName(norm)) orelse return null;
    return .{ .tree = parent, .idx = idx };
}

fn entryAt(ctx: *Ctx, path: []const u8) !?*store.Entry {
    const loc = (try locate(ctx, path)) orelse return null;
    return &loc.tree.entries.items[loc.idx];
}

fn kindOf(e: *const store.Entry) c.svn_node_kind_t {
    return if (e.kind == .dir) c.svn_node_dir else c.svn_node_file;
}

// ---------------------------------------------------------------------------
// revprops helpers
// ---------------------------------------------------------------------------
fn propsToHash(pool: ?*c.apr_pool_t, bytes: []const u8) ?*c.apr_hash_t {
    const ht = c.apr_hash_make(pool) orelse return null;
    if (bytes.len == 0) return ht;
    const list = store.decodeProps(c_alloc, bytes) catch return ht;
    defer c_alloc.free(list);
    for (list) |p| {
        const s = c.svn_string_ncreate(p.value.ptr, p.value.len, pool);
        if (s == null) continue;
        c.apr_hash_set(ht, p.name.ptr, @intCast(p.name.len), s);
    }
    return ht;
}

const c_alloc = std.heap.c_allocator;

fn propsSet(a: std.mem.Allocator, bytes: []const u8, name: []const u8, value: ?[]const u8) ![]u8 {
    var list = std.ArrayList(store.Prop).empty;
    defer list.deinit(a);
    if (bytes.len > 0) {
        const decoded = try store.decodeProps(a, bytes);
        for (decoded) |p| try list.append(a, p);
    }
    if (value) |v| {
        var found = false;
        for (list.items) |*p| {
            if (std.mem.eql(u8, p.name, name)) {
                p.value = v;
                found = true;
            }
        }
        if (!found) try list.append(a, .{ .name = name, .value = v });
    }
    if (value == null) {
        var out = std.ArrayList(store.Prop).empty;
        defer out.deinit(a);
        for (list.items) |p| {
            if (!std.mem.eql(u8, p.name, name)) try out.append(a, p);
        }
        return store.encodeProps(a, out.items);
    }
    return store.encodeProps(a, list.items);
}

// ---------------------------------------------------------------------------
// revision bookkeeping
// ---------------------------------------------------------------------------
fn rev0Key(zs: *ZStore) ![]const u8 {
    const rev = store.loadRev(&zs.client, gpa, 0) catch |e| switch (e) {
        store.Error.NotFound => {
            var empty = store.Tree{};
            const key = try store.putTree(&zs.client, gpa, &empty);
            try store.putRev(&zs.client, gpa, .{ .rev = 0, .parent = -1, .root = key, .props = "" });
            return key;
        },
        else => return e,
    };
    return rev.root;
}

fn youngestRev(zs: *ZStore) !i64 {
    if (zs.youngest >= 0) return zs.youngest;
    const head = try store.loadHead(&zs.client, gpa);
    if (head.rev < 0) {
        const key = try rev0Key(zs);
        try store.putHead(&zs.client, gpa, 0, key);
        zs.youngest = 0;
        return 0;
    }
    zs.youngest = head.rev;
    return head.rev;
}

fn rootKeyForRev(zs: *ZStore, rev: i64) ![]const u8 {
    if (rev == 0) return rev0Key(zs);
    const r = try store.loadRev(&zs.client, gpa, rev);
    return r.root;
}

// ---------------------------------------------------------------------------
// filesystem-level callbacks
// ---------------------------------------------------------------------------
fn fYoungestRev(youngest_p: [*c]c.svn_revnum_t, fs_: [*c]c.svn_fs_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const zs = ZStore.from(fs_);
    const rev = youngestRev(zs) catch |e| return mapErr(e, "cannot read HEAD");
    youngest_p.* = @intCast(rev);
    return noError();
}

fn nowSvnDate(a: std.mem.Allocator) ![]u8 {
    // nowMicros() is a local monotonic counter, not wall clock: ask APR for the
    // real thing so svn:date is a real date.
    const secs: u64 = @intCast(@divTrunc(@as(i64, @intCast(c.apr_time_now())), 1_000_000));
    const es = std.time.epoch.EpochSeconds{ .secs = secs };
    const yd = es.getEpochDay().calculateYearDay();
    const md = yd.calculateMonthDay();
    const ds = es.getDaySeconds();
    return std.fmt.allocPrint(a, "{d:0>4}-{d:0>2}-{d:0>2}T{d:0>2}:{d:0>2}:{d:0>2}.000000Z", .{
        yd.year, md.month.numeric(), md.day_index + 1,
        ds.getHoursIntoDay(), ds.getMinutesIntoHour(), ds.getSecondsIntoMinute(),
    });
}

fn revPropsBytes(zs: *ZStore, r: store.Rev) ![]const u8 {
    if (r.props.len == 0) return "";
    return store.loadBlob(&zs.client, gpa, r.props);
}

fn fRevisionProp(
    value_p: [*c][*c]c.svn_string_t,
    fs_: [*c]c.svn_fs_t,
    rev: c.svn_revnum_t,
    propname: [*c]const u8,
    refresh: c.svn_boolean_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = refresh;
    _ = scratch_pool;
    const zs = ZStore.from(fs_);
    const r = store.loadRev(&zs.client, gpa, rev) catch |e| return mapErr(e, "cannot load revision");
    if (r.props.len == 0) {
        value_p.* = null;
        return noError();
    }
    const blobbytes = revPropsBytes(zs, r) catch |e| return mapErr(e, "cannot load revision properties");
    const name = std.mem.span(propname);
    if (store.propGet(blobbytes, name)) |v| {
        value_p.* = c.svn_string_ncreate(v.ptr, v.len, result_pool);
    } else {
        value_p.* = null;
    }
    return noError();
}

fn fRevisionProplist(
    table_p: [*c]?*c.apr_hash_t,
    fs_: [*c]c.svn_fs_t,
    rev: c.svn_revnum_t,
    refresh: c.svn_boolean_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = refresh;
    _ = scratch_pool;
    const zs = ZStore.from(fs_);
    const r = store.loadRev(&zs.client, gpa, rev) catch |e| return mapErr(e, "cannot load revision");
    const blobbytes = revPropsBytes(zs, r) catch |e| return mapErr(e, "cannot load revision properties");
    table_p.* = propsToHash(result_pool, blobbytes);
    return noError();
}

fn fChangeRevProp(
    fs_: [*c]c.svn_fs_t,
    rev: c.svn_revnum_t,
    name: [*c]const u8,
    old_value_p: [*c]const [*c]const c.svn_string_t,
    value: [*c]const c.svn_string_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = old_value_p;
    _ = pool;
    const zs = ZStore.from(fs_);
    var r = store.loadRev(&zs.client, gpa, rev) catch |e| return mapErr(e, "cannot load revision");
    const nm = std.mem.span(name);
    const newval: ?[]const u8 = if (value == null) null else value.*.data[0..value.*.len];
    const props = propsSet(gpa, r.props, nm, newval) catch |e| return mapErr(e, "cannot update revprops");
    defer gpa.free(props);
    const blob = store.putBlob(&zs.client, gpa, props) catch |e| return mapErr(e, "cannot store revprops");
    r.props = blob;
    store.putRev(&zs.client, gpa, r) catch |e| return mapErr(e, "cannot write revision");
    return noError();
}

fn fSetUuid(fs_: [*c]c.svn_fs_t, uuid: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    zs.uuid = fs.dupFromPool(pool, std.mem.span(uuid));
    fs_.*.uuid = zs.uuid.ptr;
    return noError();
}

fn fRevisionRoot(root_p: [*c][*c]c.svn_fs_root_t, fs_: [*c]c.svn_fs_t, rev: c.svn_revnum_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    var want = rev;
    if (want < 0) {
        want = @intCast(youngestRev(zs) catch |e| return mapErr(e, "cannot read HEAD"));
    }
    const key = rootKeyForRev(zs, want) catch |e| return mapErr(e, "no such revision");
    return makeRoot(root_p, fs_, want, null, key, pool);
}

fn makeRoot(
    root_p: [*c][*c]c.svn_fs_root_t,
    fs_: [*c]c.svn_fs_t,
    rev: c.svn_revnum_t,
    txn: ?*Txn,
    key: []const u8,
    pool: ?*c.apr_pool_t,
) [*c]c.svn_error_t {
    const root: *c.svn_fs_root_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_root_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    const ctx = gpa.create(Ctx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    ctx.* = .{
        .zs = ZStore.from(fs_),
        .rev = rev,
        .txn = txn,
        .root_key = key,
        .dirs = if (txn) |t| &t.dirs else null,
        .a = gpa,
        .dirs_store = std.StringHashMap(*store.Tree).init(gpa),
    };
    root.* = .{
        .pool = pool,
        .fs = fs_,
        .is_txn_root = @intFromBool(txn != null),
        .txn = if (txn) |t| t.id.ptr else null,
        .txn_flags = 0,
        .rev = rev,
        .vtable = &root_vtable,
        .fsap_data = ctx,
    };
    root_p.* = root;
    return noError();
}

fn fBeginTxn(
    txn_p: [*c][*c]c.svn_fs_txn_t,
    fs_: [*c]c.svn_fs_t,
    rev: c.svn_revnum_t,
    flags: c.apr_uint32_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = flags;
    const zs = ZStore.from(fs_);
    var base: i64 = rev;
    if (base < 0) base = @intCast(youngestRev(zs) catch |e| return mapErr(e, "cannot read HEAD"));
    const key = rootKeyForRev(zs, base) catch |e| return mapErr(e, "no such revision");

    const txn = gpa.create(Txn) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    const id = std.fmt.allocPrint(gpa, "z{d}-{d}", .{ std.os.linux.getpid(), nowMicros() }) catch
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    txn.* = .{
        .zs = zs,
        .id = id,
        .base_rev = base,
        .root_key = key,
        .props = "",
        .dirs = std.StringHashMap(*store.Tree).init(gpa),
        .a = gpa,
    };

    const t: *c.svn_fs_txn_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_txn_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    t.* = .{
        .fs = fs_,
        .base_rev = @intCast(base),
        .id = id.ptr,
        .vtable = &txn_vtable,
        .fsap_data = txn,
    };
    store.putTxn(&zs.client, gpa, .{ .id = id, .base = base, .root = key, .props = "" }) catch |e|
        logf("cannot persist new transaction: {s}", .{@errorName(e)});
    txn_p.* = t;
    return noError();
}

fn fOpenTxn(
    txn_p: [*c][*c]c.svn_fs_txn_t,
    fs_: [*c]c.svn_fs_t,
    name: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    const id = std.mem.span(name);
    const rec = store.loadTxn(&zs.client, gpa, id) catch |e| switch (e) {
        error.NotFound => return err(c.SVN_ERR_FS_NO_SUCH_TRANSACTION, "no such transaction: '{s}'", .{id}),
        else => return mapErr(e, "cannot load transaction"),
    };

    const txn = gpa.create(Txn) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    txn.* = .{
        .zs = zs,
        .id = gpa.dupe(u8, id) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{}),
        .base_rev = rec.base,
        .root_key = if (rec.root.len > 0) rec.root else
            (rootKeyForRev(zs, rec.base) catch return err(c.SVN_ERR_FS_GENERAL, "no base revision", .{})),
        .props = rec.props,
        .dirs = std.StringHashMap(*store.Tree).init(gpa),
        .a = gpa,
    };

    const t: *c.svn_fs_txn_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_txn_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    t.* = .{
        .fs = fs_,
        .base_rev = @intCast(rec.base),
        .id = txn.id.ptr,
        .vtable = &txn_vtable,
        .fsap_data = txn,
    };
    txn_p.* = t;
    return noError();
}

fn fPurgeTxn(fs_: [*c]c.svn_fs_t, txn_id: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const zs = ZStore.from(fs_);
    store.deleteTxn(&zs.client, gpa, std.mem.span(txn_id)) catch |e| return mapErr(e, "cannot delete transaction");
    return noError();
}

fn fListTransactions(names_p: [*c][*c]c.apr_array_header_t, fs_: [*c]c.svn_fs_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    const ids = store.listTxnIds(&zs.client, gpa) catch |e| return mapErr(e, "cannot list transactions");
    defer {
        for (ids) |id| gpa.free(id);
        gpa.free(ids);
    }
    names_p.* = c.apr_array_make(pool, @intCast(ids.len), @sizeOf([*c]const u8));
    const elts: [*][*c]const u8 = @ptrCast(@alignCast(names_p.*.*.elts));
    for (ids, 0..) |id, i| elts[i] = fs.dupFromPool(pool, id).ptr;
    return noError();
}

fn fDeltify(fs_: [*c]c.svn_fs_t, rev: c.svn_revnum_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = rev;
    _ = pool;
    return noError();
}

fn fNoLocks() [*c]c.svn_error_t {
    return err(c.SVN_ERR_UNSUPPORTED_FEATURE, "locking is not supported by the zstore backend", .{});
}

fn lockToSvn(rec: store.LockRec, pool: ?*c.apr_pool_t) [*c]c.svn_lock_t {
    const lk = c.svn_lock_create(pool);
    lk.*.path = fs.dupFromPool(pool, rec.path).ptr;
    lk.*.token = fs.dupFromPool(pool, rec.token).ptr;
    lk.*.owner = fs.dupFromPool(pool, rec.owner).ptr;
    lk.*.comment = fs.dupFromPool(pool, rec.comment).ptr;
    lk.*.is_dav_comment = @intFromBool(rec.dav);
    lk.*.creation_date = rec.created;
    lk.*.expiration_date = rec.expires;
    return lk;
}

fn fLock(
    fs_: [*c]c.svn_fs_t,
    targets: ?*c.apr_hash_t,
    comment: [*c]const u8,
    is_dav_comment: c.svn_boolean_t,
    expiration_date: c.apr_time_t,
    steal_lock: c.svn_boolean_t,
    lock_callback: c.svn_fs_lock_callback_t,
    lock_baton: ?*anyopaque,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    if (targets == null) return noError();
    const zs = ZStore.from(fs_);
    const a = gpa;
    const pool = result_pool orelse scratch_pool;
    var hi = c.apr_hash_first(scratch_pool orelse pool, targets);
    while (hi != null) : (hi = c.apr_hash_next(hi)) {
        const path_ptr = c.apr_hash_this_key(hi) orelse continue;
        const path = std.mem.span(@as([*c]const u8, @ptrCast(path_ptr)));
        const target: ?*align(1) const c.svn_fs_lock_target_t = if (c.apr_hash_this_val(hi)) |v| @ptrCast(v) else null;

        const existing = store.loadLock(&zs.client, a, path) catch |e| return mapErr(e, "cannot read lock");
        if (existing != null and steal_lock == 0) {
            return err(c.SVN_ERR_FS_PATH_ALREADY_LOCKED, "path '{s}' is already locked", .{path});
        }
        const token = if (target) |t| (if (t.*.token != null) std.mem.span(t.*.token) else "") else "";
        var tok_buf: [80]u8 = undefined;
        const new_token: []const u8 = if (token.len > 0) token else
            (std.fmt.bufPrint(&tok_buf, "opaquelocktoken:{d}-{d}", .{ std.os.linux.getpid(), c.apr_time_now() }) catch "opaquelocktoken:zstore");

        const rec = store.LockRec{
            .path = path,
            .token = new_token,
            .owner = "",
            .comment = if (comment != null) std.mem.span(comment) else "",
            .created = c.apr_time_now(),
            .expires = expiration_date,
            .dav = is_dav_comment != 0,
        };
        if (steal_lock != 0) {
            store.putLock(&zs.client, a, rec) catch |e| return mapErr(e, "cannot write lock");
        } else {
            const ok = store.putLockIfAbsent(&zs.client, a, rec) catch |e| return mapErr(e, "cannot write lock");
            if (!ok) return err(c.SVN_ERR_FS_PATH_ALREADY_LOCKED, "path '{s}' is already locked", .{path});
        }

        if (lock_callback) |cb| {
            const lk = lockToSvn(rec, pool);
            const rc = cb(lock_baton, fs.dupFromPool(pool, path).ptr, lk, null, pool);
            if (rc != null) return rc;
        }
    }
    return noError();
}

fn fGenerateLockToken(token: [*c][*c]const u8, fs_: [*c]c.svn_fs_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    const tok = std.fmt.allocPrint(c_alloc, "opaquelocktoken:{d}-{d}", .{ std.os.linux.getpid(), nowMicros() }) catch
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    defer c_alloc.free(tok);
    token.* = fs.dupFromPool(pool, tok).ptr;
    return noError();
}

fn fUnlock(
    fs_: [*c]c.svn_fs_t,
    targets: ?*c.apr_hash_t,
    break_lock: c.svn_boolean_t,
    lock_callback: c.svn_fs_lock_callback_t,
    lock_baton: ?*anyopaque,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    if (targets == null) return noError();
    const zs = ZStore.from(fs_);
    const a = gpa;
    const pool = result_pool orelse scratch_pool;
    var hi = c.apr_hash_first(scratch_pool orelse pool, targets);
    while (hi != null) : (hi = c.apr_hash_next(hi)) {
        const path_ptr = c.apr_hash_this_key(hi) orelse continue;
        const path = std.mem.span(@as([*c]const u8, @ptrCast(path_ptr)));
        // svn_fs_unlock_many hashes path -> token (char *), unlike lock_many
        // which hashes path -> svn_fs_lock_target_t.
        const token: []const u8 = if (c.apr_hash_this_val(hi)) |v|
            std.mem.span(@as([*c]const u8, @ptrCast(v)))
        else
            "";
        const rec = (store.loadLock(&zs.client, a, path) catch |e| return mapErr(e, "cannot read lock")) orelse
            return err(c.SVN_ERR_FS_NO_SUCH_LOCK, "path '{s}' is not locked", .{path});
        if (break_lock == 0 and !std.mem.eql(u8, token, rec.token)) {
            return err(c.SVN_ERR_FS_LOCK_OWNER_MISMATCH, "lock token does not match for '{s}'", .{path});
        }
        store.deleteLock(&zs.client, a, path) catch |e| return mapErr(e, "cannot delete lock");
        if (lock_callback) |cb| {
            const lk = lockToSvn(rec, pool);
            const rc = cb(lock_baton, fs.dupFromPool(pool, path).ptr, lk, null, pool);
            if (rc != null) return rc;
        }
    }
    return noError();
}

fn fGetLock(lock: [*c][*c]c.svn_lock_t, fs_: [*c]c.svn_fs_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const rec = (store.loadLock(&zs.client, gpa, norm) catch |e| return mapErr(e, "cannot read lock")) orelse
        return err(c.SVN_ERR_FS_NO_SUCH_LOCK, "path '{s}' is not locked", .{norm});
    lock.* = lockToSvn(rec, pool);
    return noError();
}

fn fGetLocks(
    fs_: [*c]c.svn_fs_t,
    path: [*c]const u8,
    depth: c.svn_depth_t,
    get_locks_func: c.svn_fs_get_locks_callback_t,
    get_locks_baton: ?*anyopaque,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const zs = ZStore.from(fs_);
    const base = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(base);
    const all = store.listLocks(&zs.client, gpa) catch |e| return mapErr(e, "cannot list locks");
    defer {
        for (all) |rec| gpa.free(rec.path);
        gpa.free(all);
    }
    for (all) |rec| {
        const match = if (depth == c.svn_depth_infinity)
            std.mem.startsWith(u8, rec.path, base)
        else if (depth == c.svn_depth_immediates) blk: {
            if (!std.mem.startsWith(u8, rec.path, base) or std.mem.eql(u8, rec.path, base)) break :blk false;
            const rest = rec.path[base.len..];
            const trimmed = std.mem.trimStart(u8, rest, "/");
            break :blk std.mem.indexOfScalar(u8, trimmed, '/') == null;
        } else std.mem.eql(u8, rec.path, base);
        if (!match) continue;
        if (get_locks_func) |cb| {
            const lk = lockToSvn(rec, pool);
            const rc = cb(get_locks_baton, lk, pool);
            if (rc != null) return rc;
        }
    }
    return noError();
}

fn fInfoFormat(
    fs_format: [*c]c_int,
    supports_version: [*c][*c]c.svn_version_t,
    fs_: [*c]c.svn_fs_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = result_pool;
    _ = scratch_pool;
    fs_format.* = 1;
    supports_version.* = @constCast(c.svn_fs_version());
    return noError();
}

fn fInfoConfigFiles(files: [*c][*c]c.apr_array_header_t, fs_: [*c]c.svn_fs_t, result_pool: ?*c.apr_pool_t, scratch_pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = scratch_pool;
    files.* = c.apr_array_make(result_pool, 0, @sizeOf([*c]const u8));
    return noError();
}

fn fInfoFsap(fsap_info: [*c]?*const anyopaque, fs_: [*c]c.svn_fs_t, result_pool: ?*c.apr_pool_t, scratch_pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = result_pool;
    _ = scratch_pool;
    fsap_info.* = null;
    return noError();
}

fn fVerifyRoot(root: [*c]c.svn_fs_root_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = root;
    _ = pool;
    return noError();
}

fn fFreeze(
    fs_: [*c]c.svn_fs_t,
    freeze_func: c.svn_fs_freeze_func_t,
    freeze_baton: ?*anyopaque,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    if (freeze_func) |func| {
        return func(freeze_baton, pool);
    }
    return noError();
}

fn fBdbSetErrcall(fs_: [*c]c.svn_fs_t, handler: ?*const fn (errpfx: [*c]const u8, msg: [*c]u8) callconv(.c) void) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = handler;
    return noError();
}

fn fIoctl(
    fs_: [*c]c.svn_fs_t,
    ctlcode: c.svn_fs_ioctl_code_t,
    input: ?*anyopaque,
    output_p: [*c]?*anyopaque,
    cancel_func: c.svn_cancel_func_t,
    cancel_baton: ?*anyopaque,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = fs_;
    _ = ctlcode;
    _ = input;
    _ = output_p;
    _ = cancel_func;
    _ = cancel_baton;
    _ = result_pool;
    _ = scratch_pool;
    return err(c.SVN_ERR_UNSUPPORTED_FEATURE, "ioctl is not supported by the zstore backend", .{});
}

// ---------------------------------------------------------------------------
// transaction callbacks
// ---------------------------------------------------------------------------
fn txnOf(txn: [*c]c.svn_fs_txn_t) *Txn {
    return @ptrCast(@alignCast(txn.*.fsap_data.?));
}

fn flushDir(ctx: *Ctx, path: []const u8, tree: *store.Tree) ![]const u8 {
    var changed = tree.dirty;
    for (tree.entries.items) |*e| {
        if (e.kind != .dir) continue;
        const child_path = try joinChild(gpa, path, e.name);
        defer gpa.free(child_path);
        if (dmap(ctx).get(child_path)) |child| {
            if (child.dirty or e.key.len == 0) {
                const k = try flushDir(ctx, child_path, child);
                if (!std.mem.eql(u8, e.key, k)) {
                    e.key = k;
                    changed = true;
                }
            }
        }
    }
    if (!changed and tree.key.len > 0) return tree.key;
    const key = try store.putTree(&ctx.zs.client, ctx.a, tree);
    tree.key = key;
    tree.dirty = false;
    return key;
}

fn tCommit(
    conflict_p: [*c][*c]const u8,
    new_rev_p: [*c]c.svn_revnum_t,
    txn: [*c]c.svn_fs_txn_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const t = txnOf(txn);
    const zs = t.zs;

    var ctx = Ctx{
        .zs = zs,
        .rev = t.base_rev,
        .txn = t,
        .root_key = t.root_key,
        .dirs = &t.dirs,
        .a = gpa,
        .dirs_store = std.StringHashMap(*store.Tree).init(gpa),
    };
    const root_tree = treeAt(&ctx, "/") catch |e| return mapErr(e, "cannot read txn root");
    const root_key = flushDir(&ctx, "/", root_tree) catch |e| return mapErr(e, "cannot flush trees to the object store");

    // FSFS stamps svn:date here if the caller did not supply one; do the same so
    // that `svn log` shows a real date instead of "(no date)".
    if (store.propGet(t.props, "svn:date") == null) {
        const stamp = nowSvnDate(gpa) catch "";
        defer if (stamp.len > 0) gpa.free(stamp);
        if (stamp.len > 0) {
            t.props = propsSet(gpa, t.props, "svn:date", stamp) catch |e| return mapErr(e, "cannot stamp svn:date");
        }
    }

    var props_key: []const u8 = "";
    if (t.props.len > 0) {
        props_key = store.putBlob(&zs.client, gpa, t.props) catch |e| return mapErr(e, "cannot store revprops");
    }

    // Concurrency: HEAD is the single source of truth and every write to it
    // carries a precondition, so two committers cannot both claim a revision.
    // Trees and blobs are content-addressed and idempotent, so retries only
    // re-upload what they already produced.
    var attempt: usize = 0;
    var committed: i64 = -1;
    while (attempt < 32) : (attempt += 1) {
        var head_rev: i64 = -1;
        var head_etag: ?[]u8 = null;
        if (store.headWithEtag(&zs.client, gpa) catch |e| return mapErr(e, "cannot read HEAD")) |hw| {
            head_rev = hw.head.rev;
            head_etag = hw.etag;
        }
        defer if (head_etag) |e| gpa.free(e);
        // Refuse to build a revision on a base that is no longer HEAD: without
        // a three-way merge that would silently drop the winner's changes.
        if (t.base_rev != head_rev) {
            return err(c.SVN_ERR_FS_TXN_OUT_OF_DATE, "transaction base r{d} is out of date (HEAD is r{d})", .{ t.base_rev, head_rev });
        }
        const new_rev = head_rev + 1;

        const rev_cond: s3.Cond = .if_absent;
        const rev_etag: ?[]u8 = store.putRevCond(&zs.client, gpa, .{
            .rev = new_rev,
            .parent = t.base_rev,
            .root = root_key,
            .props = props_key,
        }, rev_cond) catch |e| switch (e) {
            // Another writer already published this revision number; just
            // retry from the freshly read HEAD.
            error.Precondition => continue,
            else => return mapErr(e, "cannot write revision record"),
        };
        if (rev_etag) |etag| gpa.free(etag);

        const head_cond: s3.Cond = if (head_etag) |etag| .{ .if_match = etag } else .if_absent;
        const new_head_etag: ?[]u8 = store.putHeadCond(&zs.client, gpa, new_rev, root_key, head_cond) catch |e| switch (e) {
            error.Precondition => {
                // Lost the race.  Head moved while this transaction was open,
                // so committing it as-is would silently overwrite whatever the
                // winner wrote.  Drop our revision record and tell the client
                // the transaction is out of date (it can update and retry).
                const key = std.fmt.allocPrint(gpa, "revs/{d}", .{new_rev}) catch "";
                defer if (key.len > 0) gpa.free(key);
                if (key.len > 0) zs.client.delete(key) catch {};
                return err(c.SVN_ERR_FS_TXN_OUT_OF_DATE, "transaction base r{d} is out of date (HEAD moved to r{d})", .{ t.base_rev, head_rev });
            },
            else => return mapErr(e, "cannot update HEAD"),
        };
        if (new_head_etag) |etag| gpa.free(etag);

        committed = new_rev;
        break;
    }
    if (committed < 0) return err(c.SVN_ERR_FS_GENERAL, "commit aborted: HEAD kept moving, giving up after retries", .{});
    const new_rev = committed;
    store.deleteTxn(&zs.client, gpa, t.id) catch |e|
        logf("cannot delete committed transaction record: {s}", .{@errorName(e)});
    zs.youngest = new_rev;
    new_rev_p.* = @intCast(new_rev);
    conflict_p.* = null;
    logf("committed r{d} (root {s})", .{ new_rev, root_key[0..@min(root_key.len, 12)] });
    return noError();
}

fn tAbort(txn: [*c]c.svn_fs_txn_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const t = txnOf(txn);
    store.deleteTxn(&t.zs.client, gpa, t.id) catch |e|
        logf("cannot delete transaction record: {s}", .{@errorName(e)});
    return noError();
}

fn tGetProp(
    value_p: [*c][*c]c.svn_string_t,
    txn: [*c]c.svn_fs_txn_t,
    name: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const t = txnOf(txn);
    if (store.propGet(t.props, std.mem.span(name))) |v| {
        value_p.* = c.svn_string_ncreate(v.ptr, v.len, pool);
    } else {
        value_p.* = null;
    }
    return noError();
}

fn tGetProplist(table_p: [*c]?*c.apr_hash_t, txn: [*c]c.svn_fs_txn_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const t = txnOf(txn);
    table_p.* = propsToHash(pool, t.props);
    return noError();
}

fn tChangeProp(
    txn: [*c]c.svn_fs_txn_t,
    name: [*c]const u8,
    value: [*c]const c.svn_string_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const t = txnOf(txn);
    const v: ?[]const u8 = if (value == null) null else value.*.data[0..value.*.len];
    t.props = propsSet(gpa, t.props, std.mem.span(name), v) catch |e| return mapErr(e, "cannot update txn properties");
    store.putTxn(&t.zs.client, gpa, .{ .id = t.id, .base = t.base_rev, .root = t.root_key, .props = t.props }) catch {};
    return noError();
}

fn tRoot(root_p: [*c][*c]c.svn_fs_root_t, txn: [*c]c.svn_fs_txn_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const t = txnOf(txn);
    return makeRoot(root_p, txn.*.fs, txn.*.base_rev, t, t.root_key, pool);
}

fn tChangeProplist(
    txn: [*c]c.svn_fs_txn_t,
    changes: [*c]const c.apr_array_header_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const t = txnOf(txn);
    if (changes != null and changes.*.nelts > 0) {
        const items: [*]c.svn_prop_t = @ptrCast(@alignCast(changes.*.elts));
        for (items[0..@intCast(changes.*.nelts)]) |prop| {
            const v: ?[]const u8 = if (prop.value) |s| s.*.data[0..s.*.len] else null;
            t.props = propsSet(gpa, t.props, std.mem.span(prop.name), v) catch |e| return mapErr(e, "cannot update txn properties");
        }
    }
    return noError();
}

// ---------------------------------------------------------------------------
// root callbacks: read side
// ---------------------------------------------------------------------------
fn rCheckPath(kind_p: [*c]c.svn_node_kind_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        kind_p.* = c.svn_node_dir;
        return noError();
    }
    const e = entryAt(ctx, norm) catch |er| switch (er) {
        error.NotFound => {
            kind_p.* = c.svn_node_none;
            return noError();
        },
        error.NotDir => {
            kind_p.* = c.svn_node_none;
            return noError();
        },
        else => return mapErr(er, "cannot read directory"),
    };
    kind_p.* = if (e) |entry| kindOf(entry) else c.svn_node_none;
    return noError();
}

fn rNodeId(id_p: [*c][*c]const c.svn_fs_id_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    defer gpa.free(norm);
    // Node ids must stay stable while the node is unchanged (rev_hunt
    // compares them across revisions), so identity is path plus content key
    // rather than the revision number.
    const key: []const u8 = if (norm.len <= 1)
        ctx.root_key
    else blk: {
        const e = entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node");
        break :blk (e orelse return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm})).key;
    };
    const id = makePathId(pool, key, norm) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    id_p.* = id;
    return noError();
}

fn rNodeRelation(
    relation: [*c]c.svn_fs_node_relation_t,
    root_a: [*c]c.svn_fs_root_t,
    path_a: [*c]const u8,
    root_b: [*c]c.svn_fs_root_t,
    path_b: [*c]const u8,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = scratch_pool;
    const ka = nodeKey(ctxOf(root_a), std.mem.span(path_a)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer if (ka.owned) gpa.free(ka.key);
    const kb = nodeKey(ctxOf(root_b), std.mem.span(path_b)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer if (kb.owned) gpa.free(kb.key);
    // Same content means "unchanged".  Different content is still the same
    // logical node when it sits at the same path in both revisions: an
    // "unrelated" verdict there makes rev_hunt drop every older location.
    const same_path = std.mem.eql(u8, std.mem.span(path_a), std.mem.span(path_b));
    relation.* = if (ka.key.len > 0 and std.mem.eql(u8, ka.key, kb.key))
        c.svn_fs_node_unchanged
    else if (same_path)
        c.svn_fs_node_common_ancestor
    else
        c.svn_fs_node_unrelated;
    return noError();
}

const NodeKey = struct { key: []const u8, owned: bool };

fn nodeKey(ctx: *Ctx, path: []const u8) !NodeKey {
    const norm = try normPath(gpa, path);
    defer gpa.free(norm);
    if (norm.len <= 1) {
        const t = try treeAt(ctx, "/");
        return .{ .key = t.key, .owned = false };
    }
    const e = (try entryAt(ctx, norm)) orelse return .{ .key = "", .owned = false };
    if (e.key.len > 0) return .{ .key = e.key, .owned = false };
    const tmp = try std.fmt.allocPrint(gpa, "p{d}:{s}", .{ ctx.rev, norm });
    return .{ .key = tmp, .owned = true };
}

fn rNodeCreatedRev(revision: [*c]c.svn_revnum_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        const t = treeAt(ctx, "/") catch |e| return mapErr(e, "cannot read root tree");
        const e = (entryAt(ctx, norm) catch null);
        _ = e;
        _ = t;
        revision.* = if (ctx.txn != null) @intCast(ctx.txn.?.base_rev) else 0;
        return noError();
    }
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    revision.* = if (e.created_rev >= 0) @intCast(e.created_rev) else root.*.rev;
    return noError();
}

fn rNodeOriginRev(revision: [*c]c.svn_revnum_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    return rNodeCreatedRev(revision, root, path, pool);
}

fn rNodeCreatedPath(created_path: [*c][*c]const u8, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        created_path.* = fs.dupFromPool(pool, "/").ptr;
        return noError();
    }
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    const p = if (e.created_path.len > 0) e.created_path else norm;
    created_path.* = fs.dupFromPool(pool, p).ptr;
    return noError();
}

fn rCopiedFrom(
    rev_p: [*c]c.svn_revnum_t,
    path_p: [*c][*c]const u8,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    if (e.copyfrom_rev >= 0 and e.copyfrom_path.len > 0) {
        rev_p.* = @intCast(e.copyfrom_rev);
        path_p.* = fs.dupFromPool(pool, e.copyfrom_path).ptr;
    } else {
        rev_p.* = SVN_INVALID_REVNUM;
        path_p.* = null;
    }
    return noError();
}

fn rClosestCopy(
    root_p: [*c][*c]c.svn_fs_root_t,
    path_p: [*c][*c]const u8,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    var norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    while (norm.len > 1) {
        if (entryAt(ctx, norm) catch null) |e| {
            if (e.copyfrom_rev >= 0 and e.copyfrom_path.len > 0) {
                path_p.* = fs.dupFromPool(pool, norm).ptr;
                return noError();
            }
        }
        const parent = parentOf(norm);
        if (parent.len == norm.len) break;
        norm = normPath(gpa, parent) catch break;
    }
    root_p.* = null;
    path_p.* = null;
    return noError();
}

fn rNodeProp(
    value_p: [*c][*c]c.svn_string_t,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    propname: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        value_p.* = null;
        return noError();
    }
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    const v = store.propGet(e.props, std.mem.span(propname));
    value_p.* = if (v) |val| c.svn_string_ncreate(val.ptr, val.len, pool) else null;
    return noError();
}

fn rNodeProplist(table_p: [*c]?*c.apr_hash_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        table_p.* = c.apr_hash_make(pool);
        return noError();
    }
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    table_p.* = propsToHash(pool, e.props) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    return noError();
}

fn rNodeHasProps(has_props: [*c]c.svn_boolean_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, scratch_pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = scratch_pool;
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) {
        has_props.* = 0;
        return noError();
    }
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    has_props.* = @intFromBool(e.props.len > 0);
    return noError();
}

fn rDirEntries(entries_p: [*c]?*c.apr_hash_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const tree = treeAt(ctx, norm) catch |er| switch (er) {
        error.NotFound, error.NotDir => return err(c.SVN_ERR_FS_NOT_DIRECTORY, "'{s}' is not a directory", .{norm}),
        else => return mapErr(er, "cannot read directory"),
    };
    const ht = c.apr_hash_make(pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    // svn_fs_dir_entries contract: values are svn_fs_dirent_t* (name, id, kind).
    for (tree.entries.items) |*e| {
        const d: *c.svn_fs_dirent_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_dirent_t)) orelse
            return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
        const child = if (norm.len <= 1)
            std.fmt.allocPrint(gpa, "/{s}", .{e.name}) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{})
        else
            std.fmt.allocPrint(gpa, "{s}/{s}", .{ norm, e.name }) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
        const id = makePathId(pool, e.key, child);
        gpa.free(child);
        const idv = id orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
        d.* = .{
            .name = fs.dupFromPool(pool, e.name).ptr,
            .id = idv,
            .kind = kindOf(e),
        };
        c.apr_hash_set(ht, d.name, @intCast(e.name.len), d);
    }
    entries_p.* = ht;
    return noError();
}

fn rDirOptimalOrder(
    ordered_p: [*c][*c]c.apr_array_header_t,
    root: [*c]c.svn_fs_root_t,
    entries: ?*c.apr_hash_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = root;
    // The array holds svn_fs_dirent_t* pointers (hash values), not the names.
    const arr = c.apr_array_make(result_pool, 0, @sizeOf(?*const c.svn_fs_dirent_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    _ = scratch_pool;
    if (entries) |ht| {
        // apr_hash_first needs a real pool; NULL makes it return nothing, which
        // silently empties the update order and stalls every checkout.
        var hi = c.apr_hash_first(result_pool, ht);
        while (hi != null) : (hi = c.apr_hash_next(hi)) {
            var key: ?*const anyopaque = null;
            var klen: c.apr_ssize_t = 0;
            var val: ?*anyopaque = null;
            c.apr_hash_this(hi, &key, &klen, &val);
            const slot: *?*const c.svn_fs_dirent_t = @ptrCast(@alignCast(c.apr_array_push(arr)));
            slot.* = @ptrCast(@alignCast(val.?));
        }
    }
    ordered_p.* = arr;
    return noError();
}

fn rFileLength(length_p: [*c]c.svn_filesize_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    if (e.kind != .file) return err(c.SVN_ERR_FS_NOT_FILE, "'{s}' is not a file", .{norm});
    length_p.* = @intCast(e.size);
    return noError();
}

fn rFileChecksum(
    checksum: [*c][*c]c.svn_checksum_t,
    kind: c.svn_checksum_kind_t,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    const data = readBlob(ctx, e) catch |er| return mapErr(er, "cannot read blob");
    defer gpa.free(data);
    const ck = c.svn_checksum_create(kind, pool);
    if (ck == null) return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    const raw: [*c]u8 = @ptrCast(@constCast(ck.*.digest));
    if (kind == c.svn_checksum_md5) {
        var h: [16]u8 = undefined;
        std.crypto.hash.Md5.hash(data, &h, .{});
        @memcpy(raw[0..16], &h);
    } else {
        var h: [20]u8 = undefined;
        std.crypto.hash.Sha1.hash(data, &h, .{});
        @memcpy(raw[0..20], &h);
    }
    checksum.* = ck;
    return noError();
}

fn readBlob(ctx: *Ctx, e: *const store.Entry) ![]u8 {
    if (e.key.len == 0) return gpa.dupe(u8, "");
    return store.loadBlob(&ctx.zs.client, gpa, e.key);
}

// --- streams --------------------------------------------------------------
const ReadCtx = struct {
    data: []const u8,
    pos: usize = 0,
    owned: bool = false,
};

fn readCb(baton: ?*anyopaque, buffer: [*c]u8, len: [*c]c.apr_size_t) callconv(.c) [*c]c.svn_error_t {
    const rc: *ReadCtx = @ptrCast(@alignCast(baton.?));
    const want: usize = if (len.* > 0) @intCast(len.*) else 0;
    const avail = rc.data.len - rc.pos;
    const n = @min(want, avail);
    if (n > 0) @memcpy(buffer[0..n], rc.data[rc.pos .. rc.pos + n]);
    rc.pos += n;
    len.* = @intCast(n);
    return noError();
}

fn closeReadCb(baton: ?*anyopaque) callconv(.c) [*c]c.svn_error_t {
    const rc: *ReadCtx = @ptrCast(@alignCast(baton.?));
    if (rc.owned) gpa.free(rc.data);
    gpa.destroy(rc);
    return noError();
}

fn openReadStream(data: []const u8, owned: bool, pool: ?*c.apr_pool_t) ?*c.svn_stream_t {
    const rc = gpa.create(ReadCtx) catch return null;
    rc.* = .{ .data = data, .owned = owned };
    const s = c.svn_stream_create(rc, pool);
    if (s == null) return null;
    c.svn_stream_set_read(s, &readCb);
    c.svn_stream_set_close(s, &closeReadCb);
    return s;
}

const WriteCtx = struct {
    ctx: *Ctx,
    path: []const u8,
    buf: std.ArrayList(u8) = .empty,
    pool: ?*c.apr_pool_t,
};

fn writeCb(baton: ?*anyopaque, data: [*c]const u8, len: [*c]c.apr_size_t) callconv(.c) [*c]c.svn_error_t {
    const wc: *WriteCtx = @ptrCast(@alignCast(baton.?));
    const n: usize = @intCast(len.*);
    wc.buf.appendSlice(gpa, data[0..n]) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    len.* = @intCast(n);
    return noError();
}

fn closeWriteCb(baton: ?*anyopaque) callconv(.c) [*c]c.svn_error_t {
    const wc: *WriteCtx = @ptrCast(@alignCast(baton.?));
    defer {
        wc.buf.deinit(gpa);
        gpa.free(wc.path);
        gpa.destroy(wc);
    }
    const norm = normPath(gpa, wc.path) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const sha = store.putBlob(&wc.ctx.zs.client, gpa, wc.buf.items) catch |e| return mapErr(e, "cannot store blob");
    const loc = (locate(wc.ctx, norm) catch |e| return mapErr(e, "cannot locate node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    var e = &loc.tree.entries.items[loc.idx];
    e.key = sha;
    e.size = @intCast(wc.buf.items.len);
    loc.tree.dirty = true;
    checkpoint(wc.ctx);
    return noError();
}

fn makeWriteStream(ctx: *Ctx, path: []const u8, pool: ?*c.apr_pool_t) ?*c.svn_stream_t {
    const wc = gpa.create(WriteCtx) catch return null;
    wc.* = .{ .ctx = ctx, .path = gpa.dupe(u8, path) catch return null, .pool = pool };
    const s = c.svn_stream_create(wc, pool);
    if (s == null) return null;
    c.svn_stream_set_write(s, &writeCb);
    c.svn_stream_set_close(s, &closeWriteCb);
    return s;
}

fn rFileContents(contents: [*c]?*c.svn_stream_t, root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const e = (entryAt(ctx, norm) catch |er| return mapErr(er, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    if (e.kind != .file) return err(c.SVN_ERR_FS_NOT_FILE, "'{s}' is not a file", .{norm});
    const data = readBlob(ctx, e) catch |er| return mapErr(er, "cannot read blob");
    const stream = openReadStream(data, true, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    contents.* = stream;
    return noError();
}

fn rTryProcessFileContents(
    success: [*c]c.svn_boolean_t,
    target_root: [*c]c.svn_fs_root_t,
    target_path: [*c]const u8,
    processor: c.svn_fs_process_contents_func_t,
    baton: ?*anyopaque,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(target_root);
    const norm = normPath(gpa, std.mem.span(target_path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const e = (entryAt(ctx, norm) catch null) orelse {
        success.* = 0;
        return noError();
    };
    const data = readBlob(ctx, e) catch {
        success.* = 0;
        return noError();
    };
    defer gpa.free(data);
    if (processor) |func| {
        const rc = func(data.ptr, @intCast(data.len), baton, pool);
        if (rc != null) {
            success.* = 1;
            return rc;
        }
    }
    success.* = 1;
    return noError();
}

fn rContentsChanged(
    changed_p: [*c]c_int,
    root1: [*c]c.svn_fs_root_t,
    path1: [*c]const u8,
    root2: [*c]c.svn_fs_root_t,
    path2: [*c]const u8,
    strict: c.svn_boolean_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = strict;
    _ = scratch_pool;
    const a = nodeKey(ctxOf(root1), std.mem.span(path1)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer if (a.owned) gpa.free(a.key);
    const b = nodeKey(ctxOf(root2), std.mem.span(path2)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer if (b.owned) gpa.free(b.key);
    changed_p.* = if (std.mem.eql(u8, a.key, b.key)) 0 else 1;
    return noError();
}

fn rPropsChanged(
    changed_p: [*c]c_int,
    root1: [*c]c.svn_fs_root_t,
    path1: [*c]const u8,
    root2: [*c]c.svn_fs_root_t,
    path2: [*c]const u8,
    strict: c.svn_boolean_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = strict;
    _ = scratch_pool;
    const pa = propsOf(ctxOf(root1), std.mem.span(path1)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer gpa.free(pa);
    const pb = propsOf(ctxOf(root2), std.mem.span(path2)) catch return err(c.SVN_ERR_FS_GENERAL, "cannot read node", .{});
    defer gpa.free(pb);
    changed_p.* = if (std.mem.eql(u8, pa, pb)) 0 else 1;
    return noError();
}

fn propsOf(ctx: *Ctx, path: []const u8) ![]u8 {
    const norm = try normPath(gpa, path);
    defer gpa.free(norm);
    if (norm.len <= 1) return gpa.dupe(u8, "");
    const e = (try entryAt(ctx, norm)) orelse return gpa.dupe(u8, "");
    if (e.props.len == 0) return gpa.dupe(u8, "");
    return gpa.dupe(u8, e.props);
}

// ---------------------------------------------------------------------------
// root callbacks: write side (transactions only)
// ---------------------------------------------------------------------------
fn txnOnlyErr() [*c]c.svn_error_t {
    return err(c.SVN_ERR_FS_GENERAL, "cannot modify a revision root", .{});
}

fn checkpoint(ctx: *Ctx) void {
    // Persist the transaction after every mutation so an interrupted commit
    // (server crash, dropped connection) can be reopened by svnadmin.
    const t = ctx.txn orelse return;
    if (ctx.rev != t.base_rev) return;
    const root_tree = treeAt(ctx, "/") catch return;
    const key = flushDir(ctx, "/", root_tree) catch |e| {
        logf("txn checkpoint failed to flush: {s}", .{@errorName(e)});
        return;
    };
    store.putTxn(&t.zs.client, gpa, .{ .id = t.id, .base = t.base_rev, .root = key, .props = t.props }) catch |e| {
        logf("txn checkpoint failed to persist: {s}", .{@errorName(e)});
    };
}

fn rMakeDir(root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    addNode(ctx, norm, .dir) catch |e| return mapErr(e, "cannot create directory");
    checkpoint(ctx);
    return noError();
}

fn rMakeFile(root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (entryAt(ctx, norm) catch null) |e| {
        if (e.kind != .file) return err(c.SVN_ERR_FS_NOT_FILE, "'{s}' is not a file", .{norm});
        return noError();
    }
    addNode(ctx, norm, .file) catch |e| return mapErr(e, "cannot create file");
    checkpoint(ctx);
    return noError();
}

fn addNode(ctx: *Ctx, norm: []const u8, kind: store.Kind) !void {
    const parent_path = parentOf(norm);
    const parent = try treeAt(ctx, parent_path);
    const name = baseName(norm);
    if (parent.findIndex(name) != null) return error.AlreadyExists;
    try parent.insert(ctx.a, .{
        .name = try ctx.a.dupe(u8, name),
        .kind = kind,
        .key = "",
        .size = 0,
        // The commit that creates this node is txn base + 1; without a real
        // value here the loader would report every node as created in HEAD,
        // and svn's out-of-date checks would reject disjoint commits.
        .created_rev = ctx.rev + 1,
        .created_path = try ctx.a.dupe(u8, norm),
        .props = "",
        .copyfrom_rev = -1,
        .copyfrom_path = "",
    });
    parent.dirty = true;
    if (kind == .dir) {
        discardSubtree(ctx, norm);
        const child = try gpa.create(store.Tree);
        child.* = .{ .dirty = true };
        try dmap(ctx).put(try ctx.a.dupe(u8, norm), child);
    }
}

fn discardSubtree(ctx: *Ctx, path: []const u8) void {
    var it = dmap(ctx).iterator();
    while (it.next()) |kv| {
        const k = kv.key_ptr.*;
        if (k.len > path.len and std.mem.startsWith(u8, k, path) and k[path.len] == '/') {
            _ = dmap(ctx).remove(k);
        }
    }
}

fn rDeleteNode(root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    if (norm.len <= 1) return err(c.SVN_ERR_FS_GENERAL, "cannot delete the repository root", .{});
    const parent = treeAt(ctx, parentOf(norm)) catch |e| return mapErr(e, "cannot read directory");
    if (!parent.remove(baseName(norm))) return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    parent.dirty = true;
    discardSubtree(ctx, norm);
    checkpoint(ctx);
    return noError();
}

fn rChangeNodeProp(root: [*c]c.svn_fs_root_t, path: [*c]const u8, name: [*c]const u8, value: [*c]const c.svn_string_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const loc = (locate(ctx, norm) catch |e| return mapErr(e, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    const e = &loc.tree.entries.items[loc.idx];
    const v: ?[]const u8 = if (value == null) null else value.*.data[0..value.*.len];
    e.props = propsSet(gpa, e.props, std.mem.span(name), v) catch |x| return mapErr(x, "cannot update properties");
    loc.tree.dirty = true;
    checkpoint(ctx);
    return noError();
}

fn copyNode(ctx: *Ctx, from_root: [*c]c.svn_fs_root_t, from_norm: []const u8, to_norm: []const u8) !void {
    const src_ctx = ctxOf(from_root);
    const src = (try entryAt(src_ctx, from_norm)) orelse return error.NotFound;
    const parent = try treeAt(ctx, parentOf(to_norm));
    const name = baseName(to_norm);
    if (parent.findIndex(name) != null) {
        _ = parent.remove(name);
    }
    const created_rev: i64 = if (src.created_rev >= 0) src.created_rev else from_root.*.rev;
    try parent.insert(ctx.a, .{
        .name = try ctx.a.dupe(u8, name),
        .kind = src.kind,
        .key = try ctx.a.dupe(u8, src.key),
        .size = src.size,
        .created_rev = ctx.rev + 1,
        .created_path = try ctx.a.dupe(u8, to_norm),
        .props = try ctx.a.dupe(u8, src.props),
        .copyfrom_rev = created_rev,
        .copyfrom_path = try ctx.a.dupe(u8, from_norm),
    });
    parent.dirty = true;
    discardSubtree(ctx, to_norm);
}

fn rCopy(
    from_root: [*c]c.svn_fs_root_t,
    from_path: [*c]const u8,
    to_root: [*c]c.svn_fs_root_t,
    to_path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const to_ctx = ctxOf(to_root);
    if (to_ctx.txn == null) return txnOnlyErr();
    const from_norm = normPath(gpa, std.mem.span(from_path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(from_norm);
    const to_norm = normPath(gpa, std.mem.span(to_path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(to_norm);
    copyNode(to_ctx, from_root, from_norm, to_norm) catch |e| return mapErr(e, "cannot copy node");
    checkpoint(to_ctx);
    return noError();
}

fn rRevisionLink(from_root: [*c]c.svn_fs_root_t, to_root: [*c]c.svn_fs_root_t, path: [*c]const u8, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const to_ctx = ctxOf(to_root);
    if (to_ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const src = (entryAt(ctxOf(from_root), norm) catch |e| return mapErr(e, "cannot read node")) orelse
        return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    const parent = treeAt(to_ctx, parentOf(norm)) catch |e| return mapErr(e, "cannot read directory");
    const idx = parent.findIndex(baseName(norm)) orelse return err(c.SVN_ERR_FS_NOT_FOUND, "path '{s}' not found", .{norm});
    parent.entries.items[idx].key = src.key;
    parent.entries.items[idx].size = src.size;
    parent.dirty = true;
    checkpoint(to_ctx);
    return noError();
}

fn rApplyText(
    contents_p: [*c]?*c.svn_stream_t,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    result_checksum: [*c]c.svn_checksum_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = result_checksum;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);
    const stream = makeWriteStream(ctx, norm, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    contents_p.* = stream;
    return noError();
}

fn rApplyTextdelta(
    contents_p: [*c]c.svn_txdelta_window_handler_t,
    contents_baton_p: [*c]?*anyopaque,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    base_checksum: [*c]c.svn_checksum_t,
    result_checksum: [*c]c.svn_checksum_t,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = base_checksum;
    _ = result_checksum;
    const ctx = ctxOf(root);
    if (ctx.txn == null) return txnOnlyErr();
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(norm);

    const base: []const u8 = blk: {
        const e = (entryAt(ctx, norm) catch null) orelse break :blk "";
        break :blk readBlob(ctx, e) catch break :blk "";
    };
    const source = openReadStream(base, true, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    const target = makeWriteStream(ctx, norm, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    c.svn_txdelta_apply(source, target, null, null, pool, contents_p, contents_baton_p);
    return noError();
}

fn rGetFileDeltaStream(
    stream_p: [*c]?*c.svn_txdelta_stream_t,
    source_root: [*c]c.svn_fs_root_t,
    source_path: [*c]const u8,
    target_root: [*c]c.svn_fs_root_t,
    target_path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    const tgt_norm = normPath(gpa, std.mem.span(target_path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    defer gpa.free(tgt_norm);

    // A newly added file has no source: the caller passes a NULL path, which
    // means "compare against an empty text".
    const src_data: []const u8 = blk: {
        if (source_path == null or source_root == null) break :blk "";
        const src_norm = normPath(gpa, std.mem.span(source_path)) catch break :blk "";
        defer gpa.free(src_norm);
        const e = (entryAt(ctxOf(source_root), src_norm) catch null) orelse break :blk "";
        break :blk readBlob(ctxOf(source_root), e) catch break :blk "";
    };
    const tgt_data: []const u8 = blk: {
        const e = (entryAt(ctxOf(target_root), tgt_norm) catch null) orelse break :blk "";
        break :blk readBlob(ctxOf(target_root), e) catch break :blk "";
    };
    const source = openReadStream(src_data, true, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    const target = openReadStream(tgt_data, true, pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});

    const dc = gpa.create(DeltaCtx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    dc.* = .{ .source = source, .target = target, .pool = pool };
    // Compute the whole delta up front: svn_txdelta_run needs a real scratch
    // pool, and doing it inside the next-window callback leaves the callback
    // with a NULL scratch pool (crash in apr_palloc).
    const rc = c.svn_txdelta_run(source, target, &deltaWindowCb, dc, c.svn_checksum_md5, null, null, null, pool, pool);
    if (rc != null) return rc;
    const s = c.svn_txdelta_stream_create(dc, &deltaNextWindow, null, pool);
    if (s == null) return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    stream_p.* = s;
    return noError();
}

const DeltaCtx = struct {
    source: ?*c.svn_stream_t,
    target: ?*c.svn_stream_t,
    pool: ?*c.apr_pool_t,
    windows: std.ArrayList([*c]c.svn_txdelta_window_t) = .empty,
    idx: usize = 0,
    done: bool = false,
};

fn deltaWindowCb(window: [*c]c.svn_txdelta_window_t, baton: ?*anyopaque) callconv(.c) [*c]c.svn_error_t {
    const dc: *DeltaCtx = @ptrCast(@alignCast(baton.?));
    dc.windows.append(gpa, window) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    return noError();
}

fn deltaNextWindow(window: [*c][*c]c.svn_txdelta_window_t, baton: ?*anyopaque, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = pool;
    const dc: *DeltaCtx = @ptrCast(@alignCast(baton.?));
    if (dc.idx >= dc.windows.items.len) {
        window.* = null;
        return noError();
    }
    window.* = dc.windows.items[dc.idx];
    dc.idx += 1;
    return noError();
}

fn rMerge(
    conflict_p: [*c][*c]const u8,
    source_root: [*c]c.svn_fs_root_t,
    source_path: [*c]const u8,
    target_root: [*c]c.svn_fs_root_t,
    target_path: [*c]const u8,
    ancestor_root: [*c]c.svn_fs_root_t,
    ancestor_path: [*c]const u8,
    pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = source_root;
    _ = source_path;
    _ = target_root;
    _ = target_path;
    _ = ancestor_root;
    _ = ancestor_path;
    _ = pool;
    conflict_p.* = null;
    return err(c.SVN_ERR_UNSUPPORTED_FEATURE, "merge is not supported by the zstore backend", .{});
}

fn rGetMergeinfo(
    root: [*c]c.svn_fs_root_t,
    paths: [*c]const c.apr_array_header_t,
    inherit: c.svn_mergeinfo_inheritance_t,
    include_descendants: c.svn_boolean_t,
    adjust_inherited_mergeinfo: c.svn_boolean_t,
    receiver: c.svn_fs_mergeinfo_receiver_t,
    baton: ?*anyopaque,
    result_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = root;
    _ = paths;
    _ = inherit;
    _ = include_descendants;
    _ = adjust_inherited_mergeinfo;
    _ = receiver;
    _ = baton;
    _ = result_pool;
    return noError();
}

// ---------------------------------------------------------------------------
// history
// ---------------------------------------------------------------------------
const HistoryCtx = struct {
    ctx: *Ctx,
    path: []const u8,
    rev: i64,
    /// The current point has already been handed out once.  Log walking (and
    /// blame) start by asking for the predecessor of the node's own state;
    /// yielding it once first keeps this revision in the reported window.
    reported: bool = false,
};

fn histOf(h: [*c]c.svn_fs_history_t) *HistoryCtx {
    return @ptrCast(@alignCast(h.*.fsap_data.?));
}

fn rNodeHistory(
    history_p: [*c][*c]c.svn_fs_history_t,
    root: [*c]c.svn_fs_root_t,
    path: [*c]const u8,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = scratch_pool;
    const ctx = ctxOf(root);
    const norm = normPath(gpa, std.mem.span(path)) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
    const h: *c.svn_fs_history_t = @ptrCast(@alignCast(c.apr_pcalloc(result_pool, @sizeOf(c.svn_fs_history_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    const hc = gpa.create(HistoryCtx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    hc.* = .{ .ctx = ctx, .path = norm, .rev = root.*.rev };
    h.* = .{ .vtable = &history_vtable, .fsap_data = hc };
    history_p.* = h;
    return noError();
}

fn histPrev(
    prev_history_p: [*c][*c]c.svn_fs_history_t,
    history: [*c]c.svn_fs_history_t,
    cross_copies: c.svn_boolean_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = scratch_pool;
    const hc = histOf(history);
    const ctx = hc.ctx;
    const zs = ctx.zs;
    if (hc.rev <= 0) {
        prev_history_p.* = null;
        return noError();
    }

    if (!hc.reported) {
        const h0: *c.svn_fs_history_t = @ptrCast(@alignCast(c.apr_pcalloc(result_pool, @sizeOf(c.svn_fs_history_t)) orelse
            return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
        const c0 = gpa.create(HistoryCtx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
        c0.* = .{ .ctx = ctx, .path = hc.path, .rev = hc.rev, .reported = true };
        h0.* = .{ .vtable = &history_vtable, .fsap_data = c0 };
        prev_history_p.* = h0;
        return noError();
    }

    // The node itself tells us where it came from: if it was created in this
    // revision, history either follows the copy source or stops; otherwise the
    // previous interesting point is simply the same path one revision back.
    const cur = entryAt(ctx, hc.path) catch null;
    var next_path: []const u8 = hc.path;
    var next_rev: i64 = hc.rev - 1;
    if (cur) |ce| {
        if (ce.created_rev == hc.rev) {
            if (cross_copies != 0 and ce.copyfrom_rev >= 0 and ce.copyfrom_path.len > 0) {
                next_path = gpa.dupe(u8, ce.copyfrom_path) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{});
                next_rev = ce.copyfrom_rev;
            } else {
                prev_history_p.* = null;
                return noError();
            }
        }
    }

    if (next_rev < 0) {
        prev_history_p.* = null;
        return noError();
    }
    const prev_key = rootKeyForRev(zs, next_rev) catch |e| return mapErr(e, "cannot load previous revision");
    var prev_ctx = Ctx{
        .zs = zs,
        .rev = next_rev,
        .txn = null,
        .root_key = prev_key,
        .dirs = null,
        .a = gpa,
        .dirs_store = std.StringHashMap(*store.Tree).init(gpa),
    };
    if ((entryAt(&prev_ctx, next_path) catch null) == null) {
        prev_history_p.* = null;
        return noError();
    }

    const h: *c.svn_fs_history_t = @ptrCast(@alignCast(c.apr_pcalloc(result_pool, @sizeOf(c.svn_fs_history_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    const nhc = gpa.create(HistoryCtx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    nhc.* = .{ .ctx = ctx, .path = gpa.dupe(u8, next_path) catch return err(c.SVN_ERR_FS_GENERAL, "oom", .{}), .rev = next_rev, .reported = true };
    h.* = .{ .vtable = &history_vtable, .fsap_data = nhc };
    prev_history_p.* = h;
    return noError();
}

fn histLocation(path_p: [*c][*c]const u8, revision: [*c]c.svn_revnum_t, history: [*c]c.svn_fs_history_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const hc = histOf(history);
    path_p.* = fs.dupFromPool(pool, hc.path).ptr;
    revision.* = @intCast(hc.rev);
    return noError();
}

// ---------------------------------------------------------------------------
// node ids
// ---------------------------------------------------------------------------
const IdData = struct { key: []const u8 };

fn makeId(pool: ?*c.apr_pool_t, key: []const u8) ?*c.svn_fs_id_t {
    const id: *c.svn_fs_id_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_id_t)) orelse return null));
    const data: *IdData = @ptrCast(@alignCast(c.apr_palloc(pool, @sizeOf(IdData)) orelse return null));
    data.* = .{ .key = fs.dupFromPool(pool, key) };
    id.* = .{ .vtable = &id_vtable, .fsap_data = data };
    return id;
}

fn makePathId(pool: ?*c.apr_pool_t, content_key: []const u8, path: []const u8) ?*c.svn_fs_id_t {
    const key = std.fmt.allocPrint(gpa, "{s}:{s}", .{ path, content_key }) catch return null;
    defer gpa.free(key);
    return makeId(pool, key);
}

fn idUnparse(id: [*c]const c.svn_fs_id_t, pool: ?*c.apr_pool_t) callconv(.c) ?*c.svn_string_t {
    const data: *IdData = @ptrCast(@alignCast(id.*.fsap_data.?));
    return c.svn_string_ncreate(data.key.ptr, data.key.len, pool);
}

fn idCompare(a: [*c]const c.svn_fs_id_t, b: [*c]const c.svn_fs_id_t) callconv(.c) c.svn_fs_node_relation_t {
    const da: *IdData = @ptrCast(@alignCast(a.*.fsap_data.?));
    const db: *IdData = @ptrCast(@alignCast(b.*.fsap_data.?));
    if (std.mem.eql(u8, da.key, db.key)) return c.svn_fs_node_unchanged;
    return c.svn_fs_node_unrelated;
}

// ---------------------------------------------------------------------------
// changed paths
// ---------------------------------------------------------------------------
const Change = struct {
    path: []const u8,
    kind: c.svn_fs_path_change_kind_t,
    node_kind: c.svn_node_kind_t,
    text_mod: bool,
    prop_mod: bool,
    copyfrom_rev: i64,
    copyfrom_path: []const u8,
};

fn collectChanges(ctx: *Ctx, parent_rev: i64, out: *std.ArrayList(Change)) !void {
    const new_tree = try treeAt(ctx, "/");
    var old_ctx: Ctx = undefined;
    var old_key: []const u8 = "";
    var have_old = false;
    if (parent_rev >= 0) {
        old_key = rootKeyForRev(ctx.zs, parent_rev) catch "";
        if (old_key.len > 0) {
            old_ctx = .{
                .zs = ctx.zs,
                .rev = parent_rev,
                .txn = null,
                .root_key = old_key,
                .dirs = null,
                .a = gpa,
                .dirs_store = std.StringHashMap(*store.Tree).init(gpa),
            };
            have_old = true;
        }
    }
    const old_tree: ?*store.Tree = if (have_old) (treeAt(&old_ctx, "/") catch null) else null;
    try diffTrees(ctx, out, "/", old_tree, new_tree);
}

fn diffTrees(ctx: *Ctx, out: *std.ArrayList(Change), prefix: []const u8, old_tree: ?*store.Tree, new_tree: *store.Tree) !void {
    for (new_tree.entries.items) |*ne| {
        const child_path = try joinChild(gpa, prefix, ne.name);
        defer gpa.free(child_path);

        const oe: ?*store.Entry = if (old_tree) |ot| blk: {
            const i = ot.findIndex(ne.name) orelse break :blk null;
            break :blk &ot.entries.items[i];
        } else null;

        if (oe == null) {
            try out.append(gpa, .{
                .path = try dupZ(gpa, child_path),
                .kind = c.svn_fs_path_change_add,
                .node_kind = kindOf(ne),
                .text_mod = true,
                .prop_mod = true,
                .copyfrom_rev = ne.copyfrom_rev,
                .copyfrom_path = try dupZ(gpa, ne.copyfrom_path),
            });
            if (ne.kind == .dir) {
                const t = try treeAt(ctx, child_path);
                try diffTrees(ctx, out, child_path, null, t);
            }
            continue;
        }
        const old_e = oe.?;
        const node_kind = kindOf(ne);
        if (old_e.kind != ne.kind) {
            try out.append(gpa, .{
                .path = try dupZ(gpa, child_path),
                .kind = c.svn_fs_path_change_replace,
                .node_kind = node_kind,
                .text_mod = true,
                .prop_mod = true,
                .copyfrom_rev = ne.copyfrom_rev,
                .copyfrom_path = try dupZ(gpa, ne.copyfrom_path),
            });
            continue;
        }
        if (ne.kind == .file) {
            if (!std.mem.eql(u8, old_e.key, ne.key)) {
                try out.append(gpa, .{
                    .path = try dupZ(gpa, child_path),
                    .kind = c.svn_fs_path_change_modify,
                    .node_kind = node_kind,
                    .text_mod = true,
                    .prop_mod = !std.mem.eql(u8, old_e.props, ne.props),
                    .copyfrom_rev = -1,
                    .copyfrom_path = "",
                });
            } else if (!std.mem.eql(u8, old_e.props, ne.props)) {
                try out.append(gpa, .{
                    .path = try dupZ(gpa, child_path),
                    .kind = c.svn_fs_path_change_modify,
                    .node_kind = node_kind,
                    .text_mod = false,
                    .prop_mod = true,
                    .copyfrom_rev = -1,
                    .copyfrom_path = "",
                });
            }
        } else {
            var sub: std.ArrayList(Change) = .empty;
            defer {
                for (sub.items) |sc| {
                    gpa.free(sc.path);
                    gpa.free(sc.copyfrom_path);
                }
                sub.deinit(gpa);
            }
            const old_loaded: ?store.Tree = blk: {
                if (old_e.key.len == 0) break :blk null;
                break :blk store.loadTreeByKey(&ctx.zs.client, gpa, old_e.key) catch null;
            };
            if (old_loaded) |ot_val| {
                var ot = ot_val;
                defer store.deinitTree(gpa, &ot);
                const child_abs = try std.fmt.allocPrint(gpa, "/{s}", .{child_path});
                defer gpa.free(child_abs);
                const nt = treeAt(ctx, child_abs) catch continue;
                try diffTrees(ctx, &sub, child_path, &ot, nt);
                if (sub.items.len > 0) {
                    try out.append(gpa, .{
                        .path = try dupZ(gpa, child_path),
                        .kind = c.svn_fs_path_change_modify,
                        .node_kind = c.svn_node_dir,
                        .text_mod = false,
                        .prop_mod = !std.mem.eql(u8, old_e.props, ne.props),
                        .copyfrom_rev = -1,
                        .copyfrom_path = "",
                    });
                    for (sub.items) |sc| try out.append(gpa, sc);
                    sub.items.len = 0;
                }
            }
        }
    }
    if (old_tree) |ot| {
        for (ot.entries.items) |*oe| {
            if (new_tree.findIndex(oe.name) != null) continue;
            const child_path = if (prefix.len == 0)
                try gpa.dupe(u8, oe.name)
            else
                try std.fmt.allocPrint(gpa, "{s}/{s}", .{ prefix, oe.name });
            defer gpa.free(child_path);
            try out.append(gpa, .{
                .path = try dupZ(gpa, child_path),
                .kind = c.svn_fs_path_change_delete,
                .node_kind = kindOf(oe),
                .text_mod = true,
                .prop_mod = true,
                .copyfrom_rev = -1,
                .copyfrom_path = "",
            });
        }
    }
}

fn parentRevOf(ctx: *Ctx) i64 {
    if (ctx.txn) |t| return t.base_rev;
    if (ctx.rev <= 0) return -1;
    const r = store.loadRev(&ctx.zs.client, gpa, ctx.rev) catch return -1;
    return r.parent;
}

fn rPathsChanged(changed_paths_p: [*c]?*c.apr_hash_t, root: [*c]c.svn_fs_root_t, pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    const ctx = ctxOf(root);
    if (ctx.rev <= 0 and ctx.txn == null) {
        changed_paths_p.* = c.apr_hash_make(pool);
        return noError();
    }
    const parent_rev = parentRevOf(ctx);
    var list: std.ArrayList(Change) = .empty;
    defer {
        for (list.items) |ch| {
            gpa.free(ch.path);
            gpa.free(ch.copyfrom_path);
        }
        list.deinit(gpa);
    }
    _ = collectChanges(ctx, parent_rev, &list) catch |e| return mapErr(e, "cannot compute changed paths");

    const ht = c.apr_hash_make(pool) orelse return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    for (list.items) |ch| {
        const pc: *c.svn_fs_path_change2_t = @ptrCast(@alignCast(c.apr_pcalloc(pool, @sizeOf(c.svn_fs_path_change2_t)) orelse
            return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
        pc.* = .{
            .node_rev_id = null,
            .change_kind = ch.kind,
            .text_mod = if (ch.text_mod) 1 else 0,
            .prop_mod = if (ch.prop_mod) 1 else 0,
            .node_kind = ch.node_kind,
            .copyfrom_known = if (ch.copyfrom_rev >= 0) 1 else 0,
            .copyfrom_rev = if (ch.copyfrom_rev >= 0) @intCast(ch.copyfrom_rev) else SVN_INVALID_REVNUM,
            .copyfrom_path = if (ch.copyfrom_path.len > 0) ch.copyfrom_path.ptr else null,
            .mergeinfo_mod = c.svn_tristate_unknown,
        };
        c.apr_hash_set(ht, ch.path.ptr, @intCast(ch.path.len), pc);
    }
    changed_paths_p.* = ht;
    return noError();
}

const IterCtx = struct {
    items: []c.svn_fs_path_change3_t,
    idx: usize = 0,
};

fn iterGet(change: [*c][*c]c.svn_fs_path_change3_t, iterator: [*c]c.svn_fs_path_change_iterator_t) callconv(.c) [*c]c.svn_error_t {
    const ic: *IterCtx = @ptrCast(@alignCast(iterator.*.fsap_data.?));
    if (ic.idx >= ic.items.len) {
        change.* = null;
        return noError();
    }
    change.* = &ic.items[ic.idx];
    ic.idx += 1;
    return noError();
}

fn rReportChanges(
    iterator: [*c][*c]c.svn_fs_path_change_iterator_t,
    root: [*c]c.svn_fs_root_t,
    result_pool: ?*c.apr_pool_t,
    scratch_pool: ?*c.apr_pool_t,
) callconv(.c) [*c]c.svn_error_t {
    _ = scratch_pool;
    const ctx = ctxOf(root);
    const parent_rev = parentRevOf(ctx);
    var list: std.ArrayList(Change) = .empty;
    defer {
        for (list.items) |ch| {
            gpa.free(ch.path);
            gpa.free(ch.copyfrom_path);
        }
        list.deinit(gpa);
    }
    _ = collectChanges(ctx, parent_rev, &list) catch |e| return mapErr(e, "cannot compute changed paths");

    const n = list.items.len;
    const arr: [*]c.svn_fs_path_change3_t = @ptrCast(@alignCast(c.apr_palloc(result_pool, n * @sizeOf(c.svn_fs_path_change3_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    for (list.items, 0..) |ch, i| {
        const ps = fs.dupFromPool(result_pool, ch.path);
        arr[i] = .{
            .path = .{ .data = ps.ptr, .len = ps.len },
            .change_kind = ch.kind,
            .node_kind = ch.node_kind,
            .text_mod = if (ch.text_mod) 1 else 0,
            .prop_mod = if (ch.prop_mod) 1 else 0,
            .mergeinfo_mod = c.svn_tristate_unknown,
            .copyfrom_known = if (ch.copyfrom_rev >= 0) 1 else 0,
            .copyfrom_rev = if (ch.copyfrom_rev >= 0) @intCast(ch.copyfrom_rev) else SVN_INVALID_REVNUM,
            .copyfrom_path = if (ch.copyfrom_path.len > 0) fs.dupFromPool(result_pool, ch.copyfrom_path).ptr else null,
        };
    }

    const ic = gpa.create(IterCtx) catch return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{});
    ic.* = .{ .items = arr[0..n] };
    const it: *c.svn_fs_path_change_iterator_t = @ptrCast(@alignCast(c.apr_pcalloc(result_pool, @sizeOf(c.svn_fs_path_change_iterator_t)) orelse
        return err(c.SVN_ERR_FS_GENERAL, "out of memory", .{})));
    it.* = .{ .vtable = &changes_iterator_vtable, .fsap_data = ic };
    iterator.* = it;
    return noError();
}

// ---------------------------------------------------------------------------
// error mapping
// ---------------------------------------------------------------------------
fn mapErr(e: anyerror, comptime what: []const u8) [*c]c.svn_error_t {
    return switch (e) {
        error.NotFound => err(c.SVN_ERR_FS_NOT_FOUND, what ++ ": object not found", .{}),
        error.NotDir => err(c.SVN_ERR_FS_NOT_DIRECTORY, what ++ ": not a directory", .{}),
        error.CorruptObject => err(c.SVN_ERR_FS_CORRUPT, what ++ ": corrupt object", .{}),
        error.OutOfMemory => err(c.SVN_ERR_FS_GENERAL, what ++ ": out of memory", .{}),
        error.AlreadyExists => err(c.SVN_ERR_FS_ALREADY_EXISTS, what ++ ": already exists", .{}),
        else => err(c.SVN_ERR_FS_GENERAL, what, .{}),
    };
}

// ---------------------------------------------------------------------------
// vtables
// ---------------------------------------------------------------------------
fn fRefreshRevprops(fsp: [*c]c.svn_fs_t, scratch_pool: ?*c.apr_pool_t) callconv(.c) [*c]c.svn_error_t {
    _ = fsp;
    _ = scratch_pool;
    // Revprops live inside the revision object itself, so there is nothing to
    // refresh (FSFS uses this hook to re-read on-disk revprop files).
    return noError();
}

var fs_vtable = c.fs_vtable_t{
    .youngest_rev = &fYoungestRev,
    .refresh_revprops = &fRefreshRevprops,
    .revision_prop = &fRevisionProp,
    .revision_proplist = &fRevisionProplist,
    .change_rev_prop = &fChangeRevProp,
    .set_uuid = &fSetUuid,
    .revision_root = &fRevisionRoot,
    .begin_txn = &fBeginTxn,
    .open_txn = &fOpenTxn,
    .purge_txn = &fPurgeTxn,
    .list_transactions = &fListTransactions,
    .deltify = &fDeltify,
    .lock = &fLock,
    .generate_lock_token = &fGenerateLockToken,
    .unlock = &fUnlock,
    .get_lock = &fGetLock,
    .get_locks = &fGetLocks,
    .info_format = &fInfoFormat,
    .info_config_files = &fInfoConfigFiles,
    .info_fsap = &fInfoFsap,
    .verify_root = &fVerifyRoot,
    .freeze = &fFreeze,
    .bdb_set_errcall = &fBdbSetErrcall,
    .ioctl = &fIoctl,
};

pub fn fsVtable() *c.fs_vtable_t {
    return &fs_vtable;
}

var txn_vtable = c.txn_vtable_t{
    .commit = &tCommit,
    .abort = &tAbort,
    .get_prop = &tGetProp,
    .get_proplist = &tGetProplist,
    .change_prop = &tChangeProp,
    .root = &tRoot,
    .change_props = &tChangeProplist,
};

var root_vtable = c.root_vtable_t{
    .paths_changed = &rPathsChanged,
    .report_changes = &rReportChanges,
    .check_path = &rCheckPath,
    .node_history = &rNodeHistory,
    .node_id = &rNodeId,
    .node_relation = &rNodeRelation,
    .node_created_rev = &rNodeCreatedRev,
    .node_origin_rev = &rNodeOriginRev,
    .node_created_path = &rNodeCreatedPath,
    .delete_node = &rDeleteNode,
    .copy = &rCopy,
    .revision_link = &rRevisionLink,
    .copied_from = &rCopiedFrom,
    .closest_copy = &rClosestCopy,
    .node_prop = &rNodeProp,
    .node_proplist = &rNodeProplist,
    .node_has_props = &rNodeHasProps,
    .change_node_prop = &rChangeNodeProp,
    .props_changed = &rPropsChanged,
    .dir_entries = &rDirEntries,
    .dir_optimal_order = &rDirOptimalOrder,
    .make_dir = &rMakeDir,
    .file_length = &rFileLength,
    .file_checksum = &rFileChecksum,
    .file_contents = &rFileContents,
    .try_process_file_contents = &rTryProcessFileContents,
    .make_file = &rMakeFile,
    .apply_textdelta = &rApplyTextdelta,
    .apply_text = &rApplyText,
    .contents_changed = &rContentsChanged,
    .get_file_delta_stream = &rGetFileDeltaStream,
    .merge = &rMerge,
    .get_mergeinfo = &rGetMergeinfo,
};

var changes_iterator_vtable = c.changes_iterator_vtable_t{ .get = &iterGet };
var history_vtable = c.history_vtable_t{ .prev = &histPrev, .location = &histLocation };
var id_vtable = c.id_vtable_t{ .unparse = &idUnparse, .compare = &idCompare };
