struct ValWrapper(T) {
    T val;
    void printVal() {
        import std.stdio : writeln;
        writeln("The type is ", typeid(T));
        writeln("The value is ", val);
    }
}

void main() {
    ValWrapper!int vw;
    vw.printVal();
}