import std.stdio;

void main() {
    import std.algorithm : reduce;
    import std.range : iota;
    assert(iota(6).reduce!("a + b") == 15);

    pragma(msg, typeid(iota(6).reduce!("a + b", "a - b")));
}