import std.stdio;

class Outer {
    private int _x;
    this(int x) { _x = x; }
    Inner createInner() { return new Inner; }
    override string toString() { return "Outer"; }
    class Inner {
        override string toString() {
            writeln(_x);
            return this.outer.toString ~ ".Inner";
        }
    }
}

class Outer2 {
    static class StaticInner {}
}

void main() {
    auto outer = new Outer(1);
    auto inner1 = outer.new Inner;  // OK
    writeln(inner1);
    
    // auto inner2 = new Outer.Inner;  // Error -- need Outer 'this'
    // auto inner2 = new outer.Inner;  // Error -- same as above

    auto inner = new Outer2.StaticInner;
}