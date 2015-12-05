import std.stdio;

mixin template Mixalot() {
    int count = 10;
    int increase(int x) {
        return x + count;
    }
}

void main() {
    int count = 100;
    mixin Mixalot;
    writeln(increase(20));
    writeln(count);
}