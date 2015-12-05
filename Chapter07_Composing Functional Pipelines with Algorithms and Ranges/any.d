void main() {
    import std.algorithm : any;
    import std.range : iota;
    assert(iota(50).any!("(a * 2) > 50"));
}