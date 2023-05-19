const std = @import("std");

// o(n)
// linear search
pub fn linear_search(heystack: []const u8, needle: u8) usize {
    var index: usize = undefined;
    for (heystack, 0..) |letter, idx| {
        if (letter == needle) {
            index = idx;
        }
    }
    return index;
}

//
// binary search

pub fn main() !void {
    const text_example_1 = "Zig is the best!";

    // linear search
    std.debug.print("Linear Search\n{s}\n{} Z\n{} i\n{} !\n", .{
        text_example_1,
        linear_search(text_example_1, 'Z'),
        linear_search(text_example_1, 'i'),
        linear_search(text_example_1, '!'),
    });

    //
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
