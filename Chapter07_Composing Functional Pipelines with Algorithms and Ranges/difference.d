import std.stdio;

void main() {
    import std.algorithm : setDifference;
    auto a1 = [0, 1, 2, 5, 6, 8, 9, 10];
    auto a2 = [1, 2, 3, 4, 5, 7, 8, 10, 11, 12];
    writeln(setDifference(a1, a2));
}