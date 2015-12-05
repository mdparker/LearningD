template MyTemplate(T) {
    struct ValWrapper {
        T val;
        void printVal() {
            import std.stdio : writeln;
            writeln("The type is ", typeid(T));
            writeln("The value is ", val);
        }
    }
}
void main() {
    MyTemplate!int.ValWrapper vw1;
    MyTemplate!int.ValWrapper vw2;
    vw1.val = 20;
    vw2.val = 30;
    vw1.printVal();
    vw2.printVal();
}
