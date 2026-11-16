const std = @import("std");
const s3 = @import("src/s3.zig");
pub fn main() !void {
    var c = try s3.Client.init(std.heap.page_allocator, .{
        .endpoint = "http://127.0.0.1:9000",
        .region = "us-east-1",
        .bucket = "svn",
        .access_key = "zstore",
        .secret_key = "zstore",
        .prefix = "probe",
    });
    defer c.deinit();
    const cu = @import("src/curl_bindings.zig");
    _ = cu.curl_easy_setopt(c.curl, cu.CURLOPT_VERBOSE, @as(c_long, 1));
    try c.put("hello.txt", "hello body", "text/plain");
    const got = try c.get("hello.txt");
    if (got) |g| {
        defer std.heap.page_allocator.free(g);
        std.debug.print("got len={d} body={s}\n", .{ g.len, g });
    } else std.debug.print("got null\n", .{});
}
