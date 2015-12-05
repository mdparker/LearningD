import std.stdio;

void proxy(void delegate() dg) {
    dg();
}

void main() {
    int x = 100;
    void myDel() {
        writeln(x);
    }
    proxy(&myDel);
}
