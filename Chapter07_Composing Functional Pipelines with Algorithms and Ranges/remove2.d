import std.stdio;

void main() {
    import std.algorithm : remove, SwapStrategy;
    auto arr = [1, 2, 3, 4, 5];
    arr = arr.remove!(SwapStrategy.unstable)(0, 2);
    writeln(arr);
}