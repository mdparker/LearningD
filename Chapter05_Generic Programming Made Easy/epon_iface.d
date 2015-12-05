interface Transformation(T) {
    T transform(T t);
}

class Double(T) : Transformation!T {
    T transform(T t) {
        return t * 2;
    }
}

struct Value(T) {
    T val;
    Transformation!T transformation;
    T transform() {
        val = transformation.transform(val);
        return val;
    }
}

void main() {
    import std.stdio : writeln;
    auto intVal = Value!int(10, new Double!int);
    writeln(intVal.transform());
}