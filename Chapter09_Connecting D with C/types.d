module types;
extern(C) struct CStruct {
    int x, y;
}
struct DStruct {
    int x, y;
}
void main() {
    import std.stdio;
    writeln(CStruct.mangleof);
    writeln(DStruct.mangleof);
}