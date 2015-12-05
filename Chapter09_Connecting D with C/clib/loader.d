module loader;
import std.string;
version(Posix) {
    import core.sys.posix.dlfcn;
    alias SharedLibrary = void*;
    SharedLibrary loadSharedLibrary(string libName) {
        return dlopen(libName.toStringz(), RTLD_NOW);
    }
    void unload(SharedLibrary lib) {
        dlclose(lib);
    }
    void* loadSymbol(SharedLibrary lib, string symbolName) {
        return dlsym(lib, symbolName.toStringz());
    }
}
else version(Windows) {
    import core.sys.windows.windows;
    alias SharedLibrary = HMODULE;
    SharedLibrary loadSharedLibrary(string libName) {
        import std.utf : toUTF16z;
        return LoadLibraryW(libName.toUTF16z());
    }
    void unload(SharedLibrary lib) {
        FreeLibrary(lib);
    }
    void* loadSymbol(SharedLibrary lib, string symbolName) {
        return GetProcAddress(lib, symbolName.toStringz());
    }
}
else static assert(0, "SharedLibrary unsupported on this platform.");