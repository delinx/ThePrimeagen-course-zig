const std = @import("std");

// o(n)
pub fn O_n(n: []const u8) usize {
    var sum: usize = 0;
    for (n) |letter| {
        _ = letter;
        sum = sum + 1;
    }
    return sum;
}

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    std.debug.print("test {any}\n", .{O_n("test")});
    std.debug.print("How many letters is this line? {any}\n", .{O_n("How many letters is this line?")});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
