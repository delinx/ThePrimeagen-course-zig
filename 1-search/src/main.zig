const std = @import("std");

// o(n)
// linear search
pub fn linear_search(heystack: []const u8, needle: u8) ?usize {
    for (heystack, 0..) |letter, idx| {
        if (letter == needle) {
            return idx;
        }
    }
    return null;
}

// O(logN)
// binary search
pub fn binary_search(heystack: []const i32, needle: i32) ?usize {
    var low: f32 = 0;
    var high: f32 = @intToFloat(f32, heystack.len);

    while (low < high) {
        const middle: f32 = @floor(low + (high - low) / 2);
        const value: i32 = heystack[@floatToInt(usize, middle)];

        if (value == needle) {
            return @floatToInt(usize, middle);
        }

        if (value > needle) {
            high = middle;
        }

        if (value < needle) {
            low = middle + 1;
        }
    }

    return null;
}

pub fn main() !void {
    const text_example_1 = "Zig is the best!";
    const text_example_2 = [_]i32{ 1, 2, 4, 8, 16, 32, 64, 128, 256, 512 };

    // linear search
    std.debug.print("> Linear Search\n{s}\n'Z' -> {?}\n'i' -> {?}\n'!' -> {?}\n'A' -> {?}\n\n", .{
        text_example_1,
        linear_search(text_example_1, 'Z'),
        linear_search(text_example_1, 'i'),
        linear_search(text_example_1, '!'),
        linear_search(text_example_1, 'A'),
    });

    // binary search
    std.debug.print("> Binary Search\n{any}\n'1' -> {?}\n'777' -> {?}\n'32' -> {?}\n'512' -> {?}\n\n", .{
        text_example_2,
        binary_search(&text_example_2, 1),
        binary_search(&text_example_2, 777),
        binary_search(&text_example_2, 32),
        binary_search(&text_example_2, 512),
    });
}
