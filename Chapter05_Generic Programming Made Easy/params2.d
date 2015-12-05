import std.stdio;

void printSymbol(alias Name)() {
    writeln(Name.stringof);
}

int addTwo(int x) { return x + 2; }

void main() {
    int x;
    printSymbol!x();
    printSymbol!printSymbol();

    import std.conv : to;
    printSymbol!(std.conv.to)();
    printSymbol!(std.stdio)();

    enum number = 10;
    printSymbol!number();
    printSymbol!(1+3)();
    printSymbol!"Hello"();
    printSymbol!(addTwo(3))();
}