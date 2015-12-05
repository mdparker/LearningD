import std.stdio;

struct MyStruct {
    int a, b;
    int calculate() { return a + b; }
}

class MyClass {
    int a, b;
    int calculate() { return a + b; }
}

void main() {
    MyStruct ms;                // Value type -- ready to use
    MyClass mc;                 // Classes require new before usable
    mc = new MyClass;           // Assignment
    auto mc2 = new MyClass;     // Initialization

    MyStruct ms2;
    MyStruct ms3;
    modMS(ms, ms2, &ms3);
    writeln(ms.a);        // Unchanged - ms.a is 0 (int.init)
    writeln(ms2.a);       // ms2.a is 2
    writeln(ms3.a);       // ms3.a is 3

    modMC(mc);
    writeln(mc.a);        // mc.a is 1
}

void modMS(MyStruct ms1, ref MyStruct ms2, MyStruct* ms3) {
    ms1.a = 1;  // Modifies local copy
    ms2.a = 2;  // Modifies original
    ms3.a = 3;  // Ditto.
}

void modMC(MyClass mc) {
    mc.a = 1;  // Modifies original.
}