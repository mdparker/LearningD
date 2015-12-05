import std.stdio;

void main() {
    import std.range : take;
    import std.array : split, join;
    import std.file : readText;
    import std.random : randomShuffle;
    auto wordList = readText("words.txt").split();
    wordList.randomShuffle();
    auto arr = wordList.take(10).join("|");    
    writeln(arr);    
}

