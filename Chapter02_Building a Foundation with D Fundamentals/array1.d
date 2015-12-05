import std.stdio;

void main() {
    int[3] stat1;
    writeln(stat1);

    int[] dynArray1;
    dynArray1 = new int[](3);
    int[] dynArray2 = new int[](10);
    writeln("#1: ", dynArray1.capacity);
    writeln("#2: ", dynArray2.capacity);

    int[] dynArray3;
    dynArray3.reserve(20);
    writefln("%s, %s", dynArray3.length, dynArray3.capacity);

    dynArray3 ~= 2;
    dynArray3 ~= 10;
    writeln(dynArray3);

    auto dynArray4 = dynArray3 ~ dynArray1;
    writeln(dynArray4);

    writeln(dynArray4[0]);  // Print the first element
    writeln(dynArray4[2]);  // Print the third element
    writeln(dynArray4[$-1]); // Print the last element
}