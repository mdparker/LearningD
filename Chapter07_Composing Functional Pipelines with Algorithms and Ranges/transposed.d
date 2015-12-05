import std.stdio;

void main() {
    import std.range : transposed;
    auto arr = [[1, 2, 3], [4, 5, 6]];
    auto r = transposed(arr);
    foreach(a; r) writeln(a);
}