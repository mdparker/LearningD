import std.stdio;

void append(ref int[] arr, int val) {
    arr ~= val;
}

void main() {
    auto a1 = [10,20,30];
    a1.append(40);
    writeln(a1);
}