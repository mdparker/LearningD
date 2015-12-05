import std.stdio,
       std.traits;

T sum(T)(T lhs, T rhs) if(isFloatingPoint!T) {
    import std.math : round;
    return round(lhs + rhs);
}

T sum(T)(T lhs, T rhs) if(isIntegral!T) {
    writeln("Integral");
    return cast(T)(lhs + rhs);
}

void main() {
    writeln(sum(10, 20));
    writeln(sum(22.11, 22.22));
}