module linkage;
extern(C) int cint;
extern(D) int dint;
extern(C) int aFuncWithCLinkage() { return 1; }
extern(D) int aFuncWithDLinkage() { return 2; }
void main() {
    import std.stdio;
    writeln(cint.mangleof);
    writeln(dint.mangleof);
    writeln(aFuncWithCLinkage.mangleof);
    writeln(aFuncWithDLinkage.mangleof);
}