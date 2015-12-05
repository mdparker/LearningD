import std.stdio;

void main() {
    int x;
INC: writeln(x++);
    if( x < 10) goto INC;
}