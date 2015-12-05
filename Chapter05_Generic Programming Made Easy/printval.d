import std.stdio;

void printVal(T)(T t) {
    writeln(t);
}

void printVal(T : U*, U)(T t) {
    writeln(*t);
}

void printVal(T : U[], U)(T t) {
    foreach(e; t) writeln(e);
}

void main() {
    int x = 10;
    printVal(x);
    printVal(&x);
    printVal([10, 20, 30]);
}