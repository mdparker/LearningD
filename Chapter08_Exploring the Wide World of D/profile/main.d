uint calc(uint x, uint y) {
    return x + y;
}

uint select() {
    import std.random : uniform;
    return uniform(1u, 1001u);
}

void main() {
    import std.stdio : writeln;

    for(size_t i=0; i<100; ++i) {
        writeln("Starting calculations...");
        uint result;
        for(size_t j=0; j<20; ++j)
            result += calc(select(), select());
        writeln("The accumulated result: ", result);
    }
}
