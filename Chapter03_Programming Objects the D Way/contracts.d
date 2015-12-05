import std.stdio;

enum minBuffer = 256;
size_t getData(ubyte[] buffer)
in {
    assert(buffer.length >= minBuffer);
}
out(result) {
    assert(result > 0);
}
body {
    size_t i;
    while(i < minBuffer)
        buffer[i++] = nextByte();
    return i;
}

ubyte nextByte() {
    static ubyte b;
    return b++;
}

void main() {
    ubyte[minBuffer] buf;
    writeln(getData(buf));
}