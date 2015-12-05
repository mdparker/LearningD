void main() {
    import std.range : iota, take;
    import std.algorithm : equal;
    assert(equal(iota(51).take(20), iota(20)));
}