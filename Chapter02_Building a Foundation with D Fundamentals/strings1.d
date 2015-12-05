import std.stdio;

void main() {
    import std.conv : to, parse;
    int x = 10;
    auto s = to!string(x);

    auto s1 = "10";
    auto x1 = to!int(s1);       // OK
    auto s2 = "10and20";
    auto x2 = parse!int(s2);    // OK: x2 = 10
    //auto x3 = to!int(s2);       // ConvException
    writeln(x1);
    writeln(x2);
}