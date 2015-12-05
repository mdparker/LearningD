import std.stdio;
struct Array(T, size_t Size = 0) {
    static if(Size > 0)
        T[Size] elements;
    else
        T[] elements;
    bool isDynamic() @property {
        return Size == 0;
    }
}

void main() {
    Array!int arr1;
    assert(arr1.isDynamic);
    writeln("arr1.isDynamic = ", arr1.isDynamic);
    Array!(float, 10) arr2;
    assert(!arr2.isDynamic);
    writeln("arr2.isDynamic = ", arr2.isDynamic);

}