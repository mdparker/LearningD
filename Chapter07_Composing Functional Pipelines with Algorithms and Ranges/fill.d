import std.stdio;

void main() {
    import std.algorithm : fill;
    int[20] sink;
    fill(sink[], 100);
    foreach(n; sink)
        writeln(n);
}