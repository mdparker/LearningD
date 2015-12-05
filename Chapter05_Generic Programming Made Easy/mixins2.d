import std.stdio;

mixin template ValueImpl(T) {
    private T _value;
    T value() @property {
        return _value;
    }
    void value(T val) @property {
        static bool isSet;
        if(!isSet) {
            _value = val;
            isSet = true;
        }
    }
}

struct Value {
    mixin ValueImpl!int;
}

struct ExtendedValue {
    mixin ValueImpl!int;
    float extendedValue;
}

void printValue(T)(T t) if(is(typeof(T.value))) {
    writeln(t.value);
}

void main() {
    Value val;
    val.value = 20;
    printValue(val);

    ExtendedValue exval;
    exval.value = 100;
    printValue(exval);
}