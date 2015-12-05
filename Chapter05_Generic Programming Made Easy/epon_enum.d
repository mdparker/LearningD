enum isLongOrInt(T) = is(T == long) || is(T == int);

void main() {
    import std.stdio : writeln;
    writeln(isLongOrInt!long);
    writeln(isLongOrInt!float);
}