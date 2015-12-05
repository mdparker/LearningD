import std.functional;
auto filter(alias predicate, R)(R source)
    if(is(typeof(unaryFun!predicate)))
{
    struct FilteredRange {
        private R _source;
        this(R source) {
            _source = source;
            skipNext();
        }
        bool empty() { return _source.empty; }
        auto ref front() { return _source.front; }
        void popFront() {
            _source.popFront();
            skipNext();
        }
        private void skipNext() {
            while(!_source.empty && !unaryFun!predicate(_source.front))
                _source.popFront();
        }
    }    
    return FilteredRange(source);
}

auto range(T)(T[] array) {
    struct ArrayRange(T) {
        private T[] _array;
        bool empty() @property {
            return _array.length == 0;
        }
        ref T front() {
            return _array[0];
        }
        void popFront() {
            _array = _array[1 .. $];
        }
    }
    return ArrayRange!T(array);
}

T[] array(T, R)(R range) @property {
    T[] ret;
    while(!range.empty) {
        ret ~= range.front;
        range.popFront();
    }
    return ret;
}

unittest {
    auto arr = [10, 13, 300, 42, 121, 20, 33, 45, 50, 109, 18];
    auto result = arr.range
                     .filter!(x => x < 100 )
                     .filter!(x => (x & 1) == 0)
                     .array!int();
    assert(result == [10,42,20,50,18]);

    arr = [1,2,3,4,5,6];
    result = arr.range.filter!(x => (x & 1) == 0).array!int;
    assert(result == [2, 4, 6]);

    arr = [1, 3, 5, 7];
    auto r = arr.range.filter!(x => (x & 1) == 0);
    assert(r.empty);

    arr = [2,4,6,8];
    result = arr.range.filter!(x => (x & 1) == 0).array!int;
    assert(result == arr);
}

