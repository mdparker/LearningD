import std.stdio;

string[] pickWords(string[] words, size_t maxLen, string[] sink) {
    import std.algorithm : filter, copy;
    import std.range : take;
    auto remaining = words
        .filter!(s => s.length <= maxLen)
        .take(sink.length)
        .copy(sink); 
    return sink[0 .. sink.length - remaining.length];
}


void main() {
    import std.array : split;
    import std.file : readText;
    import std.random : randomShuffle;

    auto wordList = readText("words.txt").split();
    wordList.randomShuffle();

    size_t start;
    string[20] sink;
    auto selectedWords = wordList[start .. $].pickWords(8, sink);

    foreach(i, word; selectedWords)
        writefln("#%s %s", i + 1, word);
}