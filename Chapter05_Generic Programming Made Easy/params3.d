import std.stdio;

class Base {
    void printType() { writeln(typeid(this)); }
}
class Derived : Base {}

void main() {
    Derived der = new Derived;
    Base base = new Derived;
    der.printType();
    base.printType();
}