import std.stdio;

struct StructCon {
    int x, y;
    this(int val) { x = y = val; }
    @disable this();                    // Disabled default initialization
}  

struct Container {
    StructCon sc = StructCon.init;      // Can't declare Container instance
                                        // without manually initializing
                                        // sc to StructCon.init because of @disable(this)
                                        // on StructCon type.
}

struct NoCompile {
    StuctCon sc;
}

void main() {
    Container con;

    // Uncomment the next line and compilation will fail.
    // NoCompile nc;       
}