import std.stdio;

void main() {
    int y;
    ref int getRef() {
        return y;
    }
    auto i = getRef();
    i = 10;
    writeln(y);
}