import std.stdio;

void main() {
    import std.range : iota, chain;
    auto r = chain(iota(10), iota(10, 20), iota(20, 30));
    foreach(i; r) writeln(i);
}