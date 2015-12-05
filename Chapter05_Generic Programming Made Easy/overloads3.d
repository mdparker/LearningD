import std.stdio;

struct Number(T) {
    T value;
    T opUnary(string op)() if(op != "*") {
        mixin("return " ~ op ~ "value;");
    }
}

void main() {
    auto num = Number!int(10);
    writeln(-num);
    writeln(++num);
    writeln(--num);
    writeln(+num);
    writeln(~num);
}