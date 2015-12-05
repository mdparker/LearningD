import std.stdio;

void main() {
    import std.range : iota, take, takeExactly;
    // OK -- returned range has 10 elements
    auto r1 = iota(10).take(12);
    // Assert failure -- takeExactly requires 12 elements
    //auto r2 = iota(10).takeExactly(12);

    foreach(i; r1) writeln(i);
}