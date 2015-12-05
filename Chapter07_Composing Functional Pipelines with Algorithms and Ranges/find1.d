import std.stdio;
void main() {
    import std.algorithm : find;
    import std.range : iota;
    auto r = iota(10).find(7);
    writeln(r);
}