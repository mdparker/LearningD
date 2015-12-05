import std.stdio;

class C {
    private int _x;
    void opAssign(int x) { _x = x; }
}

struct S {
    private int _x;
    void opAssign(int x) { _x = x; }
    void opAssign(S s) { _x = s._x; }
}

void main() {
    S s1, s2;
    s1 = 10;
    s2 = s1;
    writeln(s1);

    auto c = new C;
    c = 10;
    writeln(c._x);
}