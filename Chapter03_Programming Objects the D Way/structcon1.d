import std.stdio;

struct StructCon {
    int x, y;
    this(int val) { x = y = val; }
}

struct PostBlit {
    int[] foo;
    this(this) { foo = foo.dup; }
}

void printPtr(PostBlit cpb) {
    writeln("Inside: ", cpb.foo.ptr);
}

struct Destruct {
    ~this() { writeln("Destructed!"); }
}

void doSomething() {
    writeln("Intializing a Destruct.");
    Destruct d;
    writeln("Leaving the function.");
}

void main() {
    StructCon s1;               // .init: x and y are 0
    auto s2 = StructCon();      // .init literal: x and y are 0
    auto s3 = StructCon(12);    // constructor: x = y = 12

    writeln(s1);
    writeln(s2);
    writeln(s3);

    auto pb = PostBlit([10,20,30]);
    writeln("Outside: ", pb.foo.ptr);
    printPtr(pb);

    doSomething();
    writeln("Leaving main.");
}