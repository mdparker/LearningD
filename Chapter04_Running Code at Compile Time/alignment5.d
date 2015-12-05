import std.stdio;
struct FileHeader {
    align(1):
        byte fmtVersion;
        int magic;
        byte id;
}

void main() {
    writeln(FileHeader.sizeof);
}
