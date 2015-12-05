module intscope;

int addTwo(int x) {
    // We lied, we're adding 20
    return x + 20;
}

void main() {
    import declscope, std.stdio : writeln;
    writeln(NumTemplate!().constant);
}