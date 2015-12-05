import std.stdio;

struct Number(T) {
    T value;
    bool opCast(C)() if(is(C == bool)) {
        return value != 0;
    }

    import std.traits;
    C opCast(C)() if(isNumeric!C) {
        return cast(C)value;
    }
}

void main() {
    auto num1 = Number!int(10);
    Number!int num2;
    writeln(cast(bool)num1);
    writeln(cast(bool)num2);
    writeln(cast(byte)num1);
}