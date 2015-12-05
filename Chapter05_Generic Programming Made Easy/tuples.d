import std.stdio;

void printTuple(T...)() if(T.length != 0) {
    foreach(i, _; T) 
        writeln(T[i].stringof);
}

void printThreeValues(int a, string b, double c) {
    writefln("%s, %s, %s", a, b, c);
}

struct UnpackMe {
    int meaningOfLife;
    string meaningOfFood;
    double lifeOf;
}

void printThreeTemplateParams(T, string U, alias V)() {
    writefln("%s, %s, %s", T.stringof, U, V.stringof);
}

void printTuple2(T...)(T args) {
    foreach(i, _; T)
        pragma(msg, T[i].stringof);
    foreach(item; args) 
        writeln(item);
}

void main() {
    import std.meta : AliasSeq;
    AliasSeq!(int, string, double) isdTuple1;
    alias ISD = AliasSeq!(int, string, double);
    ISD isdTuple2;

    printTuple!isdTuple1;
    printTuple!ISD;

    isdTuple1[0] = 42;
    isdTuple1[1] = "Pizza!";
    isdTuple1[2] = 3.14;
    printThreeValues(isdTuple1);

    auto um = UnpackMe(42, "Pizza!", 3.14);
    printThreeValues(um.tupleof);

    printThreeTemplateParams!(AliasSeq!(int, "Hello", std.stdio));

    printTuple2(42, "Pizza!", 3.14);
}

