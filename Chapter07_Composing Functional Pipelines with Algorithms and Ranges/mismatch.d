void main() {
    import std.algorithm : mismatch, equal;
    auto s1 = "Michael";
    auto s2 = "Michel";
    auto t1 = mismatch(s1, s2);
    assert(equal(t1[0], "ael"));
    assert(equal(t1[1], "el"));

    auto arr = [1, 2, 3];
    auto t2 = mismatch(arr, arr);
    assert(t2[0].length == 0);
    assert(t2[1].length == 0);
}