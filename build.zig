const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSafe });

    const mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    const lib = b.addLibrary(.{
        .name = "svn_fs_zstore",
        .linkage = .dynamic,
        .root_module = mod,
    });

    // http client to the S3 endpoint
    lib.root_module.linkSystemLibrary("curl", .{});
    lib.root_module.linkSystemLibrary("z", .{});

    // svn/apr symbols come from the host process (svnserve / svnadmin), so the
    // module must be allowed to keep them unresolved until dlopen() time.
    lib.root_module.addCMacro("ZSTORE_MODULE", "1");

    b.installArtifact(lib);
    b.getInstallStep().dependOn(&b.addInstallFile(
        lib.getEmittedBin(),
        "lib/libsvn_fs_zstore-1.so.0",
    ).step);

    const test_mod = b.createModule(.{
        .root_source_file = b.path("src/test_root.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    test_mod.linkSystemLibrary("curl", .{});
    test_mod.linkSystemLibrary("z", .{});
    const tests = b.addTest(.{ .root_module = test_mod });
    const run_tests = b.addRunArtifact(tests);
    b.step("test", "Run unit tests").dependOn(&run_tests.step);
}
