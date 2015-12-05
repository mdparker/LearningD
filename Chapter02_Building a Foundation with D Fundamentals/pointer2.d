import std.stdio;

void main() {
    auto num = 1;          // int
    void* voidPtr = &num;  // OK: int* converts to void*
    writeln(*voidPtr); // Error: void has no value
    writeln(*cast(int*)voidPtr); // OK: dereferencing int*.
}