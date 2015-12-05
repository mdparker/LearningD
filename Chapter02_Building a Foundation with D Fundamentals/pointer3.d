import std.stdio;

void main() {
    import core.stdc.stdlib : malloc, free;
    int* intsPtr = cast(int*)malloc(int.sizeof * 10); // Ten ints
    free(intsPtr);
    auto dontDoThis = malloc(int.sizeof);
    auto thisIsOK = cast(int*)malloc(int.sizeof);
}