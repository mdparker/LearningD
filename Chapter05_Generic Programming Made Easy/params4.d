import std.stdio;

class Base {
    void printType(this T)() { writeln(typeid(T)); }
}
class Derived : Base {}

void main() {
    Derived der = new Derived;
    Base base = new Derived;
    der.printType();
    base.printType();
}