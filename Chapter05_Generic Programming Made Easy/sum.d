import std.stdio;

T sum(T : ulong)(T lhs, T rhs) {
    writeln("Integral specialization.");
    return cast(T)(lhs + rhs);
}

T sum(T : real)(T lhs, T rhs) {
    writeln("Floating-point specialization.");
    import std.math : round;
    return round(lhs + rhs);
}

void main() {
    writeln(sum(10, 20));
    writeln(sum(10.11, 3.22));
}