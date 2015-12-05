extern(C) @nogc nothrow {
    version(ClibDynamic)
        int function(int) some_c_function;
    else
        int some_c_function(int);
}

void main() {
    version(ClibDynamic)
    {
        import loader;
        version(Win64) enum libName = "clib64.dll";
        else version(Win32) enum libName = "clib32.dll";
        else enum libName = "libclib.so";

        auto lib = loadSharedLibrary(libName);
        if(!lib) throw new Exception("Failed to load library " ~ libName);

        some_c_function = cast(typeof(some_c_function))lib.loadSymbol("some_c_function");
        if(!some_c_function) throw new Exception("Failed to load some_c_function");
    }

    import std.stdio;
    writeln(some_c_function(10));
}