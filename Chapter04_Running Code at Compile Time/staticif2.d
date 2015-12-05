import std.stdio;

struct SomethingSilly {
    static if(size_t.sizeof == 8)       // 64-bit
        double value;
    else
        float value;
}

void main() {
    writeln(SomethingSilly.sizeof);
}