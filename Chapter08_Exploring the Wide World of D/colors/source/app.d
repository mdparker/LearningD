import colorize;

void coloredPrint(string msg) {
    import std.random : uniform;
    auto fore = uniform!fg;
    auto back = uniform!bg;
    auto style = uniform!mode;
    cwriteln(msg.color(fore, back, style));
}

void main(string[] args) {
    import std.stdio : writeln, readln;
    writeln("Enter some text to colorize:");
    auto input = readln();
    coloredPrint(input);
}