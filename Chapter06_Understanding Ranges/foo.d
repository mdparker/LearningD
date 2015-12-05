
import std.stdio;

struct ArrayRange(T) {
    private T[] _array;
    struct SliceInfo {
        size_t i, j;
    }
    bool empty() @property {
        return _array.length == 0;
    }
    ref T front() {
        return _array[0];
    }
    void popFront() {
        _array = _array[1 .. $];
    }
    void popBack() {
        _array.length -= 1;
    }
    ref T back() {
        return _array[$-1];
    }
    /*
    SliceInfo opSlice(size_t dim)(size_t i, size_t j) {
        return SliceInfo(i, j);
    }
    auto opIndex(SliceInfo info) {
        return ArrayRange(_array[info.i .. info.j]);
    }
    */
    auto opSlice(size_t i, size_t j) {
        return ArrayRange(_array[i .. j]);
    }
    size_t opDollar() { return _array.length; }
    auto save() { return this; }

}

void main() {
import std.range : hasSlicing;
//static assert(hasSlicing!ArrayRange);
auto r = ArrayRange!int([1, 2, 3, 4, 5]);
writeln(r[1 .. $-1]);
}