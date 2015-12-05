import std.stdio;
struct AType {
    int x;
    int addXTo(double d) {
        return x + cast(int)d;
    }
}
void main() {
    static if(is(AType == struct)) {
        writeln("It's a struct!");
    } else static if(is(AType == class)) {
        writeln("It's a class!");
    }
}