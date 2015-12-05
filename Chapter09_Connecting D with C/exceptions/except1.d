extern(C) nothrow alias CallbackFunc = void function();
extern(C) @nogc nothrow void callCallback(CallbackFunc);
extern(C) nothrow void callbackImpl() {
    throw new Exception("Testing!");
}
void main() {
    try {
        callCallback(&callbackImpl);
    }
    catch(Exception e) {
        import std.stdio : writeln;
        writeln("Caught it!");
    }
}