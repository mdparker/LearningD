import std.stdio;

void manyFuncs() {
    int innerNumber1() {
        writeln("Number1");
        return 1;
    }
    {
        void innerNumber2() {
            writeln("Number2");
        }
        innerNumber2();
    }
    for(int i=0; i<10; ++i) {
        void innerNumber3() {
            writeln(i);
        }
        innerNumber3();
    }
    innerNumber1();
}

void main() {
    manyFuncs();
}