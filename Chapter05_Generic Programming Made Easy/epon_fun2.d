import std.stdio;

struct Value {
    private int _val;
    T getAs(T)() {
        import std.conv : to;
        return to!T(_val);
    }
}

void main() {
    auto value = Value(100);
    auto valstr = value.getAs!string();
    writeln(valstr);
}