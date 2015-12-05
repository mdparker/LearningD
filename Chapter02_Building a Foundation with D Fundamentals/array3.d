import std.stdio;

void main() {
    auto arr1 = [1.0f,2.0f,3.0f];   // float[]
    auto arr2 = [1.0f,2.0,3.0];     // double[]
    auto arr3 = [1.0,2.0f,3.0f];    // double[]

    int[3] arr4 = [1,2,3];          // OK
    // Error: mismatched array lengths
    //int[3] arr5 = [1,2,3,4];

    writeln(arr1);
    writeln(arr2);
    writeln(arr3);
    writeln(arr4);
}