import std.stdio;

void main() {
    import std.algorithm : map;
    import std.range : iota;
    auto r = iota(100, 111).map!("a", "a * 2", "a / 2");
    foreach(t; r ) {
        writefln("%s * 2 = %s", t[0], t[1]);
        writefln("%s / 2 = %s", t[0], t[2]);
    }
    foreach(t; r) {
        writeln(t[0]);
    }
}