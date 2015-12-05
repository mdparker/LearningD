import std.range;
import std.stdio;

struct IR {
    private uint _number;
    enum empty = false;
    auto front() { return _number; }
    void popFront() { ++_number; }
}

static assert(isInfinite!IR);

void main() {
    writeln("Yep! It's infinite.");
}