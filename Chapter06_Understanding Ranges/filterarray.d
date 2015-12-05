import std.functional;
T[] filterArray(alias predicate, T)(T[] source)
    if(is(typeof(unaryFun!predicate(source[0]))))
{
    T[] sink;
    foreach(t; source) {
        if(unaryFun!predicate(t))
            sink ~= t;
    }
    return sink;
}
unittest {
    auto ints = [1, 2, 3, 4, 5, 6, 7];
    auto even = ints.filterArray!(x => (x & 1) == 0)();
    assert(even == [2, 4, 6]);
}
