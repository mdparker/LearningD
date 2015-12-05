struct Packed {
    double x;
    float y;
    byte z;
    byte w;
}
void main() {
    import std.stdio : writeln;
    writeln(Packed.x.offsetof);
    writeln(Packed.y.offsetof);
    writeln(Packed.z.offsetof);
    writeln(Packed.w.offsetof);
}
