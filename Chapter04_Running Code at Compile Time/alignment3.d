struct NotPacked {
    int x;
    long y;
    byte z;
    double w;
}
void main() {
    import std.stdio : writeln;
    writeln(NotPacked.x.offsetof);
    writeln(NotPacked.y.offsetof);
    writeln(NotPacked.z.offsetof);
    writeln(NotPacked.w.offsetof);
}
