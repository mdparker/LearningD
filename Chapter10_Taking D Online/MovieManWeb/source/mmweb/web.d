module mmweb.web;

import vibe.vibe;
import mmweb.db;

enum ListType {
    generic,
    addMovie,
    findMovie,
    updateMovie,
}

struct ListInfo {
    long offset;
    long limit = 10;
    Movie[] movies;
    ListType type;

    this(ListType type) { this(0, type); }

    this(long offset, ListType type) {
        this.offset = offset;
        this.type = type;
    }
}

final class MovieMan {
    void index(long offset=0, long limit = 10) {
        auto info = ListInfo(offset, ListType.generic);
        info.limit = limit;
        info.movies = listMovies(limit, offset);
        render!("index.dt", info);
    }

    void postAdd(string title, int caseNumber, int pageNumber, int discNumber, int seasonNumber) {
        auto id = addMovie(title, caseNumber, pageNumber, discNumber, seasonNumber);
        auto info = ListInfo(ListType.addMovie);
        info.movies = findMovie(id);
        render!("index.dt", info);
    }

    void postFind(string title, int caseNumber, int pageNumber) {
        Find params;
        if(title !is null && title != "N/A")
            params |= Find.byTitle;
        if(caseNumber && !pageNumber) params |= Find.byCase;
        else if(caseNumber && pageNumber) params |= Find.byCasePage;
        
        auto info = ListInfo(ListType.findMovie);
        info.movies = findMovie(params, title, caseNumber, pageNumber);
        render!("index.dt", info);
    }
}

