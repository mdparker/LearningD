import std.stdio;

void main() {
    auto formatStr = "%10-s %10-s %20-s %20-s";
    writefln( formatStr, "Name", ".sizeof", ".min", ".max");
    writefln(formatStr, "byte", byte.sizeof, byte.min, byte.max);
    writefln(formatStr, "ubyte", ubyte.sizeof, ubyte.min, ubyte.max);
    writefln(formatStr, "short", short.sizeof, short.min, short.max);
    writefln(formatStr, "ushort", ushort.sizeof, ushort.min, ushort.max);
    writefln(formatStr, "int", int.sizeof, int.min, int.max);
    writefln(formatStr, "uint", uint.sizeof, uint.min, uint.max);
    writefln(formatStr, "long", long.sizeof, long.min, long.max);
    writefln(formatStr, "ulong", ulong.sizeof, ulong.min, ulong.max);
}