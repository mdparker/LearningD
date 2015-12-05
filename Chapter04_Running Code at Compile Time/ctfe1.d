import std.stdio;

uint packRGBA(ubyte r, ubyte g, ubyte b, ubyte a = 255) {
    return (r << 24) + (g << 16) + (b << 8) + a;
}

// Assigning constants
enum red = packRGBA(255, 0, 0);
immutable green = packRGBA(0, 255, 0);
const blue = packRGBA(0, 0, 255);

struct FooColor {
    // Setting default init values for members variables
    uint r = packRGBA(255, 0, 0);
    // Initializing static member variables
    static green = packRGBA(0, 255, 0);
}

void main() {
    // Intializing local static variables
    static _red = packRGBA(255, 0, 0);
    // This is executed at runtime
    writeln(packRGBA(0, 255, 0));
}