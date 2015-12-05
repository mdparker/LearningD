import std.stdio;

struct PrintAction {
    void opCall(string arg1, int arg2) {
        writefln(`Taking action on "%s" and %s`, arg1, arg2);
    }
}

void main() {
    PrintAction print;
    print("A number", 42);
}
