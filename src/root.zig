//! zstore: a Subversion FS backend that keeps every revision object in an
//! S3-compatible object store (MinIO / SeaweedFS / AWS S3).
//!
//! The module is loaded by libsvn_fs through apr_dso:
//!   library name : libsvn_fs_zstore-1.so
//!   entry point  : svn_fs_zstore__init
const std = @import("std");
pub const c = @import("svn_bindings.zig");
pub const s3 = @import("s3.zig");
pub const store = @import("store.zig");

comptime {
    _ = @import("fs.zig");
}
