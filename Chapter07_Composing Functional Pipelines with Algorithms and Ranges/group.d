import std.stdio;

void main() {
    import std.algorithm : group;
    auto arr = [1, 1, 1, 1, 2, 3, 3, 6, 6, 4, 3, 3, 3, 3];
    auto r = arr.group();
    foreach(val, count; r)
        writefln("%s appears %s times", val, count);
}