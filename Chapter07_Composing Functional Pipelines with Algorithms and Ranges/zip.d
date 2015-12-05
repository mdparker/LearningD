import std.stdio;

void main() {
    import std.range : iota, zip;
    import std.algorithm : filter;
    auto r = zip(iota(1, 11), iota(11, 21))
                .filter!(t => (t[0] & 1) == 0);
    foreach(i; r) writeln(i);
}