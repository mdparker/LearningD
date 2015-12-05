T sum(T)(T lhs, T rhs) {
    return lhs + rhs;
}

void main() {
    import std.stdio : writeln;
    auto doubles = sum!double(2.0, 3.0);
    auto floats = sum(2.0f, 3.0f);
    writeln(typeid(floats));
}