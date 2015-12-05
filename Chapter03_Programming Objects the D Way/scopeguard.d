import std.stdio;

void manipulateData() {
    import core.stdc.stdlib : malloc, free;
    auto buf = cast(ubyte*)malloc(1024);
    scope(exit) {
        if(buf) free(buf);
        writeln("buf is freed");
    }
    buf[0] = 1;
    writeln(buf[0]);
    writeln("Exiting function");
}

void main() {
    manipulateData();
}