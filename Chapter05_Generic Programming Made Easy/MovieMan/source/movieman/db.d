module movieman.db;

import std.stdio;

struct Movie {
    string title;
    uint caseNumber;
    uint pageNumber;
}

void addMovie(Movie movie) {
    _movies ~= movie;
    writefln("\nMovie '%s' added to the database.", movie.title);
}

void deleteMovies(Movie[] movies) {
    writeln();
    foreach(ref movie; movies)
        writefln("Movie '%s' deleted from the database.", movie.title);
}

bool movieExists(string title) {
    return false;
}

auto getMovies() {
    return _movies._items;
}

auto getMovies(string title) {
    return _movies._items;
}

auto getMovies(uint caseNumber, uint pageNumber = 0) {
    return _movies._items;
}

private:
    DBTable!Movie _movies;

    struct DBTable(T) {
        T[] _items;

        void opOpAssign(string op : "~")(auto ref T t) {
            _items ~= t;
        }
    }