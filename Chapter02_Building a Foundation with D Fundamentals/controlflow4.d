import std.stdio;

void main() {
    int x = 100;
    if(x >= 200)
        writeln("200 or higher!");
    else if( x >= 100)
        writeln("100 or higher!");
    else
        writeln("Less than 100!");

    string isFour = (2 + 2 == 4) ? "It’s a 4!" : "It’s not a 4!";
    writeln(isFour);
}