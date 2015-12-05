import std.stdio;

void main() {
    auto tenArray = [5,10,15,20,25,30,35,40,45,50];
    auto sliced = tenArray[0 .. 5];
    writeln(sliced.capacity);
    tenArray[0] = 10;
    writeln(sliced);
    writeln(tenArray);
    writeln(sliced.ptr);
    writeln(tenArray.ptr);
    sliced ~= 55;
    writefln("Pointers: %s %s", tenArray.ptr, sliced.ptr);
    writefln("Caps: %s %s", tenArray.capacity, sliced.capacity);

    auto shrink = [10, 20, 30, 40, 50];
    shrink = shrink[0 .. $-1];
    assumeSafeAppend(shrink);

    writeln(shrink);
    shrink = shrink[0 .. 2] ~ shrink[3 .. $];
    writeln(shrink);

    int[] dyn = [1,2,3];
    int[3] stat1 = dyn;     // OK: lengths match
    // Error: mismatched array lengths
    //int[4] stat2 = dyn;
    int[] sliced1 = stat1;  // OK: same as stat1[]

}