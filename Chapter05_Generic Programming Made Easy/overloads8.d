import std.stdio;

struct MyArray(T) {
    struct SliceInfo {
        size_t start, end;
    }
    private T[] _vals;
    T opIndex(size_t i) {
        return _vals[i];
    }
    T[] opIndex(SliceInfo info) {
        return _vals[info.start .. info.end];
    }
    SliceInfo opSlice(size_t dim)(size_t start, size_t end) {
        return SliceInfo(start, end);
    }
}

struct My2DArray(T) {
    struct SliceInfo {
        size_t start, end;
    }
    private T[][] _vals;
    this(T[] dim1, T[] dim2) {
        _vals ~= dim1;
        _vals ~= dim2;
    }
    T opIndex(size_t i, size_t j) {
        return _vals[i][j];
    }
    auto opIndex(SliceInfo info1, SliceInfo info2) {
        return My2DArray(
            _vals[0][info1.start .. info1.end],
            _vals[1][info2.start .. info2.end]
        );
    }
    SliceInfo opSlice(size_t dim)(size_t start, size_t end) {
        return SliceInfo(start, end);
    }
}

void main() {
    auto ma = MyArray!int([10, 20, 30, 40, 50]);
    writeln(ma[1 .. 3]);

    auto m2a = My2DArray!int(
        [10, 20, 30, 40, 50],
        [100, 200, 300, 400, 500]
    );
    writeln(m2a[0 .. 2, 2 .. 5]);
}