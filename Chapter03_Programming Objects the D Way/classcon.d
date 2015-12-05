import std.stdio;

class OneCon {
    private int x;
    this(int x) { this.x = x; }
}

class TwoCon {
    private int _x;
    this() { this(10); }
    this(int x) { _x = x; }
}

class Decon {
    this() { writeln("Decon constructed!"); }
    ~this() { writeln("Decon destructed!"); }
    void print() { writeln("Decon printing."); }
}

void printDecon() {
    auto d = new Decon;
    d.print();
}
void main() {
    auto oc = new OneCon(10);
    writeln(oc);

    auto tc1 = new TwoCon();
    auto tc2 = new TwoCon;
    writeln(tc1);
    writeln(tc2);

    printDecon();
    writeln("Leaving main.");
}
static ~this() { writeln("Module destructor."); }