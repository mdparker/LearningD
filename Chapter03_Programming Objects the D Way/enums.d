import std.stdio;

enum Side {top, bottom, left, right}
enum Color : ubyte {red, green, blue, alpha}

void main() {
    auto s = Side.bottom;
    final switch(s) {
        case Side.top: writeln("On top"); break;
        case Side.bottom: writeln("On the bottom"); break;
        case Side.left: writeln("On the left"); break;
        case Side.right: writeln("On the right"); break;
    }
}