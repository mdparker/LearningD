module mmweb.db;

import d2sqlite3;

struct Movie {
    long id;
    string title;
    int caseNumber;
    int pageNumber;
    int discNumber;
    int seasonNumber;
}

enum Find {
    none        = 0x0,
    byTitle     = 0x1,
    byCase      = 0x2,
    byTitleCase = 0x3,
    byCasePage  = 0x4,
    byAll       = byTitle | byCase | byCasePage,
}

shared static this()
{
    import mmweb.sql;

    _db = Database("./movieman.db");
    _db.begin();
    scope(success) _db.commit();
    scope(failure) _db.rollback();

    _db.execute(createTableSQL);
    _insert = _db.prepare(insertSQL);
    _list = _db.prepare(listSQL);
    _findByID = _db.prepare(byIDSQL);
    _findByTitle = _db.prepare(byTitleSQL);
    _findByCase = _db.prepare(byCaseSQL);
    _findByCasePage = _db.prepare(byCasePageSQL);
    _findByTitleCase = _db.prepare(byTitleCaseSQL);
    _findByAll = _db.prepare(byAllSQL);
}

Movie[] listMovies(long limit, long offset) {
    _list.reset();
    _list.bind(1, limit);
    _list.bind(2, offset);
    return _list.getResults();
}

Movie[] findMovie(long id) {
    _findByID.reset();
    _findByID.bind(1, id);
    return _findByID.getResults();
}

Movie[] findMovie(Find by, string title, int caseNumber, int pageNumber) {

    Statement sql;
    scope(exit) sql.reset();

    final switch(by) with(Find) {
        case byTitle:
            sql = _findByTitle;
            sql.bind(1, title);
            break;

        case byCase:
            sql = _findByCase;
            sql.bind(1, caseNumber);
            break;

        case byTitleCase:
            sql = _findByTitleCase;
            sql.bind(1, title);
            sql.bind(2, caseNumber);
            break;

        case byCasePage:
            sql = _findByCasePage;
            sql.bind(1, caseNumber);
            sql.bind(2, pageNumber);
            break;

        case byAll:
            sql = _findByAll;
            sql.bind(1, title);
            sql.bind(2, caseNumber);
            sql.bind(3, pageNumber);
            break;

        case none: return [];
    }

    return sql.getResults();
}

long addMovie(string title, int caseNumber, int pageNumber, int discNumber = 0, int seasonNumber = 0) {
    _db.begin();
    scope(success) _db.commit();
    scope(failure) _db.rollback();
    
    _insert.reset();
    _insert.bind(1, title);
    _insert.bind(2, caseNumber);
    _insert.bind(3, pageNumber);
    _insert.bind(4, discNumber);
    _insert.bind(5, seasonNumber);
    _insert.execute();

    return _db.lastInsertRowid();
}

private:
    Database _db;
    Statement _insert;
    Statement _list;
    Statement _findByID;
    Statement _findByTitle, _findByCase, _findByTitleCase, _findByCasePage, _findByAll;

    Movie[] getResults(Statement statement) {
        auto results = statement.execute();
        Movie[] movies;

        if(!results.empty) {
            movies.reserve(10);
            foreach(row; results) {
                movies ~= Movie(
                    row.peek!long(0),
                    row.peek!string(1),
                    row.peek!int(2),
                    row.peek!int(3),
                    row.peek!int(4),
                    row.peek!int(5)
                );
            }
        }
        return movies;
    }