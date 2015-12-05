import std.stdio;
void dontCallMe() {
    writeln("Not covered.");
    writeln("Me neither");
}
void callMe() {
    writeln("Covered.");
}
void main() {
    callMe();
    callMe();
}