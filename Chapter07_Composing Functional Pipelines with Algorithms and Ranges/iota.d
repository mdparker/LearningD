import std.stdio;

void main() {
    import std.range : iota;
    // Prints 0 - 9
    foreach(i; iota(10)) writeln(i);
    // Prints 1 - 10
    foreach(i; iota(1, 11)) writeln(i);
    // Prints all even numbers from 2 - 20
    foreach(i; iota(2, 21, 2)) writeln(i);
}