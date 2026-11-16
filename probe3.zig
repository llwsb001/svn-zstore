const std = @import("std");
const s3 = @import("src/s3.zig");

pub fn main() !void {
    const a = std.heap.c_allocator;
    var client = try s3.Client.init(a, .{
        .endpoint = "http://127.0.0.1:9100",
        .bucket = "svn",
        .prefix = "probe3",
        .access_key = "zstore",
        .secret_key = "zstore",
    });
    defer client.deinit();

    client.delete("cas/a") catch {};
    client.delete("cas/b") catch {};

    // create-only, twice: second must be rejected
    const e1 = try client.putCond("cas/a", "one", "text/plain", .if_absent);
    std.debug.print("put create etag={s}\n", .{e1.?});
    const again = client.putCond("cas/a", "two", "text/plain", .if_absent);
    std.debug.print("second create -> {any}\n", .{again});

    const cur = try client.headEtag("cas/a");
    std.debug.print("head etag={s}\n", .{cur.?});

    const ok = try client.putCond("cas/a", "three", "text/plain", .{ .if_match = cur.? });
    std.debug.print("if-match update etag={s}\n", .{ok.?});
    const stale = client.putCond("cas/a", "four", "text/plain", .{ .if_match = cur.? });
    std.debug.print("stale if-match -> {any}\n", .{stale});

    try client.copy("cas/b", "cas/a");
    const b = (try client.get("cas/b")).?;
    std.debug.print("copy b = {s}\n", .{b});
    const keys = try client.listKeys("cas/");
    std.debug.print("list n={d}\n", .{keys.len});
    for (keys) |k| std.debug.print("  {s}\n", .{k});
}
