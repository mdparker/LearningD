module movieman.db;

import std.stdio;

struct Movie {
    string title;
    uint caseNumber;
    uint pageNumber;

    int opCmp(ref const(Movie) rhs) {
        import std.algorithm : cmp;
        if(this == rhs) 
            return 0;
        else if(caseNumber == rhs.caseNumber 
                && pageNumber == rhs.pageNumber)
            return title.cmp(rhs.title);
        else if(caseNumber == rhs.caseNumber)
            return pageNumber - rhs.pageNumber;
        else
            return caseNumber - rhs.caseNumber;
    }
}

void addMovie(Movie movie) {
    _movies ~= movie;
    writefln("\nMovie '%s' added to the database.", movie.title);
}

void deleteMovies(Movie[] movies) {
    _movies.removeItems(movies);
    writeln();
    foreach(ref movie; movies)
        writefln("Movie '%s' deleted from the database.", movie.title);
}

bool movieExists(string title) {
    import std.algorithm : canFind;
    return _movies[].canFind!(m => m.title == title);
}

auto getMovies() {
    return _movies[];
}

auto getMovies(string title) {
    import std.algorithm : filter;
    return _movies[].filter!(m => m.title == title);
}

auto getMovies(uint caseNumber) {
    import std.algorithm : filter;
    return _movies[].filter!(m => m.caseNumber == caseNumber);
}

auto getMovies(uint caseNumber, uint pageNumber) {
    import std.algorithm : filter;
    return _movies[].filter!(m => m.caseNumber == caseNumber &&
            m.pageNumber == pageNumber);
}

private:
    DBTable!Movie _movies;

    struct DBTable(T) {
        T[] _items;
        bool _sortRequired;

        void removeItems(T[] ts) {
            import std.algorithm : find, canFind, copy, filter;
            auto dirty = _items.find!(m => ts.canFind(m));
            auto tail = dirty.filter!(m => !ts.canFind(m)).copy(dirty);
            _items = _items[0 .. $ - tail.length];
        }

        void opOpAssign(string op : "~")(auto ref T t) {
            _items ~= t;
            _sortRequired = true;
        }

        auto opIndex() {
            import std.algorithm : sort;            
            struct Range {
                T[] items;

                bool empty() @property {
                    return items.length == 0;
                }

                ref T front() @property {
                    return items[0];
                }

                void popFront() {
                    items = items[1 .. $];
                }

                size_t length() @property {
                    return items.length;
                }
            }
            if(_sortRequired) {
                _items.sort();
                _sortRequired = false;
            }
            return Range(_items);
        }
    }