import std.stdio;

struct MembersOnly {
    static int x;
    int y;
    int z = 10; // Initialized to 10 for all instances
    static void printX() {
        writeln(x);
    }
    void printYZ() {
        writefln("%s, %s", this.x, y); // this.x is the same as x
    }
}

void main() {
    MembersOnly mo;
    writeln(mo.z);
    mo.printYZ();

    MembersOnly.x += 1;
    MembersOnly.printX();
}