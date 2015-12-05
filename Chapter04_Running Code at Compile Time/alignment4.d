import std.stdio;
struct FileHeader {
    byte fmtVersion;
    int magic;
    byte id;
}

void main() {
    writeln(FileHeader.sizeof);
}
