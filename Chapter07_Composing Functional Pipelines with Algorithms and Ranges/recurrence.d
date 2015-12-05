import std.stdio;

void main() {
    import std.range : recurrence, take;
    auto r1 = recurrence!("a[n-1] + a[n-2]")(0, 1).take(20);
    foreach(n; r1) writeln(n);

    writeln();
    writeln();

    auto r2 = recurrence!((a,n) => a[n-1] + 2)(2).take(10);
    foreach(n; r2) writeln(n);
}