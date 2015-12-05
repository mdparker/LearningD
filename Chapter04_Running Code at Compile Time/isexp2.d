struct AType {
    int x;
    int addXTo(double d) {
        return x + cast(int)d;
    }
}
void main() {
    static if(is(typeof(AType.addXTo(30.0)))) {
        import std.stdio : writeln;
        AType t;
        writeln(t.addXTo(30.0));
    }
}
