import std.stdio;

immutable fileData1 = import("myfile1.txt");
enum fileData2 = import("myfile2.txt");

void main() {
    writeln(fileData1);
    writeln(fileData2);
}
