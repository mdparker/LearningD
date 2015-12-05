import std.stdio;

void update(int[] arr, size_t index, int val) {
    arr[index] = val;
}

void main() {
    int[3] a1 = [10,20,30];
    a1.update(1, 25);
    writeln(a1);
}