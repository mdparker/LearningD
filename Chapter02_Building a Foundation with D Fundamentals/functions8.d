import std.stdio;

inout(int)[] writeAndReturn(inout(int)[] arr) {
    writeln(arr);
    return arr;
}

void main() {
    immutable(int)[] ia = [10,20,30];
    int[] a = [1,2,3];
    writeln(typeid(writeAndReturn(ia)));
    writeln(typeid(writeAndReturn(a)));
}