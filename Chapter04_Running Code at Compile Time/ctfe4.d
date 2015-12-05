import std.stdio;

string genDebugMsg(string msg) {
    if(__ctfe)
        return "CTFE_" ~ msg;
    else
        return "DBG_" ~ msg;
}
pragma(msg, genDebugMsg("Running at compile time."));
void main() {
    writeln(genDebugMsg("Running at runtime."));
}