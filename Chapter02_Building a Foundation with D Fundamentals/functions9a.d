import std.stdio;

void myFunc(int x) { writeln(x); }
void main() {
    void function(int) funcPtr = &myFunc;
    funcPtr(22);  // call MyFunc
}
