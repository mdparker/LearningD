void main(string[] args) {
    import std.getopt;
    import std.stdio : writeln;
    bool printMeaning;
    int repeatCount = 1;
    auto helpInfo = getopt(
        args,
        "print-meaning", "Print the meaning of life.", &printMeaning,
        "repeat-count", "Number of times to repeat the meaning of life.", &repeatCount
    );
    if(helpInfo.helpWanted) {
        defaultGetoptPrinter(
            "This program can show you the meaning of life, if you tell it to.",
            helpInfo.options
        );
        return;
    }
    if(printMeaning && repeatCount > 0) {
        for(int i=0; i<repeatCount; ++i)
            writeln("The meaning of life is 42.");
    }
    else {
        writeln("You have opted not to learn the meaning of life.");
    }
}