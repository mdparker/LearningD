import std.stdio;

void printArgs(T...)() if(T.length != 0) {
    foreach(sym; T) 
        writeln(sym.stringof);
}

alias ArgList(T...) = T;

void main() {
    printArgs!(int, "Pizza!", std.stdio, writeln);
    printArgs!(ArgList!(int, string, double));
}