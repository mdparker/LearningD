import std.stdio;

string[] pickWords(string[] words, size_t maxLen, string[] sink) {
    size_t matches;
    foreach(s; words) {
        if(s.length <= maxLen) {
            sink[matches] = s;
            if(++matches == sink.length)
                break;
        }
    }
    return sink[0 .. matches];
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