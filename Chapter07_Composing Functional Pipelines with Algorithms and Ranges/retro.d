import std.stdio;

void main() {
    import std.range : iota, retro;
    auto r = iota(1, 21).retro();
    foreach(i; r) writeln(i);
}