import std.stdio;

void main() {
    import std.algorithm : copy;
    import std.range : iota;
    int[20] sink;
    auto r = iota(10).copy(sink[]);
    iota(10, 20).copy(r);
    writeln(sink);
}