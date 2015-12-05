import std.stdio;

void main() {
    import std.range : iota, drop;
    auto r = iota(1, 21).drop(10);
    foreach(i; r) writeln(i);
}