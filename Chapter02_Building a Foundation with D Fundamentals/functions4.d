import std.stdio;

void swap(ref int x, ref int y) {
    auto tmp = x;
    x = y;
    y = tmp;
}

void main() {
    int x = 10;
    int y = 20;
    swap(x, y);
    writeln(x, ", ", y);
}
