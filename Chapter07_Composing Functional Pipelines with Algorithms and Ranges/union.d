import std.stdio;

void main() {
    import std.algorithm : setUnion;
    auto a1 = [0, 1, 2, 4, 6];
    auto a2 = [1, 3, 4, 6];
    auto a3 = [0, 1, 2, 3, 4];
    writeln(setUnion(a1, a2, a3));
}