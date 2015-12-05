import std.stdio;

struct NoMembers {
    void opDispatch(string s)() {
        writeln("Attempted to access member ", s);
    }
}

struct HodgePodge {
    void printTwoInts(int a, int b) {
        writefln("I like the ints %s and %s!", a, b);
    }

    int addThreeInts(int x, int y, int z) {
        return x + y + z;
    }
}

struct Dispatcher {
    private HodgePodge _podge;

    auto opDispatch(string s, Args...)(Args args) {
        static if(__traits(hasMember, HodgePodge, s)) {
            import std.traits : ParameterTypeTuple;
            alias params = ParameterTypeTuple!(
                mixin("HodgePodge." ~ s));
            if(params.length == args.length)
                mixin("return _podge." ~ s ~ "(args);");
        }
    }
}

void main() {
    NoMembers nm;
    nm.doSomething();
    nm.someProperty();

    Dispatcher d;
    d.printTwoInts(10, 20);
    writeln(d.addThreeInts(10, 20, 30));
}