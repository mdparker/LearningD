void main() {
    import core.stdc.stdio : puts;
    auto str = "Giving a D string to a C function.";
    // Not a general-purpose solution. For calling puts, it's harmless.
    puts(str.ptr);
}