extern(C) nothrow alias CallbackFunc = void function();
extern(C) @nogc nothrow void callCallback(CallbackFunc);
extern(C) nothrow void callbackImpl() {
    _callbackExceptions ~= new Exception("Testing!");
}
class RecoverableLibraryException : Exception {
    this(string msg) {
        super(msg);
    }
}
Exception[] _callbackExceptions;
void main() {
    import std.stdio : writeln;
    callCallback(&callbackImpl);
    foreach(ex; _callbackExceptions) {
        if(auto arle = cast(RecoverableLibraryException)ex)
            writeln(arle.toString);
        else {
            writeln("Not recoverable!");
            throw ex;
        }
    }
}
