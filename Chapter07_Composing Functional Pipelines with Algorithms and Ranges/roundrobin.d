import std.stdio;

void main() {
    import std.range : iota, roundRobin;
    auto rr = roundRobin(iota(3), iota(3, 6), iota(6, 9));
    foreach(i; rr) writeln(i);
}