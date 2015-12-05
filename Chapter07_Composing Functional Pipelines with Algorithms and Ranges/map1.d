import std.stdio;

void main() {
    import std.algorithm : map;
    import std.range : iota;
    auto r = iota(1, 21).map!(x => x * 2);
    foreach(n; r) writeln(n);
}