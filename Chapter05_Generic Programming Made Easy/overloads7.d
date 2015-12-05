import std.stdio;

struct IterateMe {
    int[10] values;

    void initialize() {
        foreach(i; 0..10)
            values[i] = i;
    }

    int opApply(int delegate(ref int) dg) {
        int result;
        foreach(v; values) {
            result = dg(v);
            if(result)
                break;
        }
        return result;
    }
}

struct AA {
    int[string] aa;

    void initialize() {
        aa = ["One":1, "Two":2, "Three":3];
    }

    int opApply(int delegate(string, ref int) dg) {
        int result;
        foreach(key, val; aa) {
            result = dg(key, val);
            if(result)
                break;
        }
        return result;
    }
}

void main() {
    IterateMe im;
    im.initialize();
    foreach(i; im)
        writeln(i);

    AA aa;
    aa.initialize();
    foreach(k, v; aa)
        writefln("%s: %s", k, v);
}