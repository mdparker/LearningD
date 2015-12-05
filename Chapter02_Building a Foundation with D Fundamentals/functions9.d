import std.stdio;
void normalParam(int x) {
    writeln("Entered normalParam");
    writeln(x);
}
void lazyParam(lazy int x) {
    writeln("Entered lazyParam.");
    writeln(x);
}
int getInt() {
    writeln("Entered getInt"); 
    return 10; 
}
void main() {
    normalParam(getInt());
    lazyParam(getInt());   
}