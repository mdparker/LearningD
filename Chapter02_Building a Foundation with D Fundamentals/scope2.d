import std.stdio;

int x;
void main() {
    writeln(x); // OK: refers to global x
    int x; // OK: shadowing global variables allowed
    writeln(x); // OK: refers to local x
    int y;      // Function scope
    // Opening a new scope
    {
        // Error: local y is shadowing main.y
        // int y;
        int z;
    }
    // Opening a new scope
    {
        // OK: This scope and the one above are independent of
        // each other.
        int z;
    }
}
