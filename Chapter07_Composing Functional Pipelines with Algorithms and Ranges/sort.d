import std.stdio;

void main() {
    import std.algorithm : sort, SwapStrategy;
    import std.range : take;
    import std.array : split;
    import std.file : readText;
    import std.random : randomShuffle;
    auto wordList = readText("words.txt").split();
    wordList.randomShuffle();
    writeln(wordList.sort().take(10));
}