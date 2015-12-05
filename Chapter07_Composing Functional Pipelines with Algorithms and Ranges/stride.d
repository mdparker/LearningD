import std.stdio;

void main() {
    import std.range : iota, stride;
    auto r1 = iota(21).stride(2);
    foreach(i; r1) writeln(i);

    writeln();
    writeln();

    auto r2 = iota(257).stride(2).stride(16);
    foreach(i; r2) writeln(i);
}