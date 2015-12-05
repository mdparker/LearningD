import std.stdio;

struct TypeMe {
    void printType(this T)() const {
        writeln(T.stringof);
    }
}

void main() {
    const(TypeMe) ct;
    immutable(TypeMe) it;
    TypeMe t;
    ct.printType();
    it.printType();
    t.printType();
}