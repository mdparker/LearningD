import std.stdio;

void main() {
    import std.array : appender;
    import std.algorithm : filter, copy;
    import std.range : iota;
    auto app = appender!(int[]);
    iota(50).filter!("(a & 1) == 0").copy(app);
    foreach(n; app.data) writeln(n);    
}