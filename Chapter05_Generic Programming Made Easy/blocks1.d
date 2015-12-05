template MyTemplate(T) {
    T val;
    void printVal() {
        import std.stdio : writeln;
        writeln("The type is ", typeid(T));
        writeln("The value is ", val);
    }
}

void main() {
    MyTemplate!(int).val = 20;
    MyTemplate!int.printVal();
    alias mtf = MyTemplate!float;
    mtf.printVal();
}