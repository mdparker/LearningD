import std.stdio;

struct PrintOps {
    void print(double arg) { writeln(arg); }
}

struct MathOps {
    PrintOps printer;
    alias printer this;
    double add(double a, double b) { return a + b; }
}

void main() {
    MathOps ops;
    auto val = ops.add(1.0, 2.0);  // Calls Mathops.add
    ops.print(val);                // Calls Printer.print
}