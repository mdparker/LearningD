import std.stdio;

uint packRGBA(ubyte r, ubyte g, ubyte b, ubyte a = 255) {
    return (r << 24) + (g << 16) + (b << 8) + a;
}

void main() {
    auto white = packRGBA(255, 255, 255);
    auto transWhite = packRGBA(255, 255, 255, 127);

    writeln("(255, 255, 255, 255) packed is ", white);
    writeln("(255, 255, 255, 127) packed is ", transWhite);

}