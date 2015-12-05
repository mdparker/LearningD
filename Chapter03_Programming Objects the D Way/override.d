import std.stdio;

class Base {
    void print(int i) {
        writeln(i);
    }
    void print(double d) {
        writeln(d);
    }
}
class Sub : Base {
    alias print = super.print; 
    override void print(int i) {
        super.print(i * 10);
    }
}
void main() {
    auto s = new Sub;
    s.print(2.0);
}
