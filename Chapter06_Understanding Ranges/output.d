import std.stdio;

struct MyOutputRange(T) {
    private T[] _elements;
    void put(T elem) {
        _elements ~= elem;
    }
}

void main() {
    MyOutputRange!int range;
    auto nums = [11, 22, 33, 44, 55];
    import std.range : put;
    put(range, nums);
    writeln(range);
}