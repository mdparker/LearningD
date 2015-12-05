import std.stdio;

void main() {
    auto num = 1;
    auto numPtr = &num;
    writefln("The value at address %s is %s", numPtr, *numPtr);
    num = 2;
    writefln("The value at address %s is %s", numPtr, *numPtr);
}