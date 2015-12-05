import std.stdio;

enum a = __traits(isUnsigned, uint);
enum b = __traits(isUnsigned, 10 + 11);
enum c = __traits(isUnsigned, 10u + 11u);
enum d = __traits(isUnsigned, uint, 10u + 11u, 10.0 - 9.0);

static assert(a);
static assert(!b);
static assert(c);
static assert(!d);

struct Point {
    int x, y;
}
void main() {
    auto p = Point(10, 20);
    writeln(__traits(getMember, p, "x"));
    __traits(getMember, p, "y") = 33;
    writeln(p.y);
}
