const std = @import("std");
const cu = @import("src/curl_bindings.zig");
pub fn main() !void {
    var gpa = std.heap.page_allocator;
    const h = cu.curl_easy_init() orelse return error.NoHandle;
    defer cu.curl_easy_cleanup(h);
    const body = try gpa.dupe(u8, "hello body");
    defer gpa.free(body);
    var slist: [*c]cu.struct_curl_slist = null;
    slist = cu.curl_slist_append(slist, "Content-Type: text/plain");
    defer cu.curl_slist_free_all(slist);
    _ = cu.curl_easy_setopt(h, cu.CURLOPT_URL, "http://127.0.0.1:9000/svn/probe/slice.txt");
    _ = cu.curl_easy_setopt(h, cu.CURLOPT_HTTPHEADER, slist);
    _ = cu.curl_easy_setopt(h, cu.CURLOPT_CUSTOMREQUEST, "PUT");
    _ = cu.curl_easy_setopt(h, cu.CURLOPT_POSTFIELDS, @as(?*const anyopaque, @ptrCast(body.ptr)));
    _ = cu.curl_easy_setopt(h, cu.CURLOPT_POSTFIELDSIZE, @as(c_long, @intCast(body.len)));
    const rc = cu.curl_easy_perform(h);
    std.debug.print("rc={d} bodyptr={*}\n", .{ rc, body.ptr });
}
