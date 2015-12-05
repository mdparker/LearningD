import std.stdio;

class CallMe {
    void foo() {}
    void bar() const { writeln("It works!"); }
 }
void main() {
    const CallMe cm = new CallMe;
    // cm.foo();   // Error – mutable function on const reference
    cm.bar();   // OK
}
