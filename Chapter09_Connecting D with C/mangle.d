module mangle;
import std.stdio;
int x;
void printInt(int i) { writeln(i); }
void main() {
    writeln(x.mangleof);
    writeln(printInt.mangleof);
}