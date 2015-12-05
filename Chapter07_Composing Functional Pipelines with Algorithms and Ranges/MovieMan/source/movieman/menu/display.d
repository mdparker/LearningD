module movieman.menu.display;

import std.stdio,
       std.array;
import movieman.io,
       movieman.db,
       movieman.menu.menu;

final class DisplayMenu : Menu {

private:
    enum Options : uint {
        byTitle = 1u,
        allOnPage,
        allInCase,
        all,
        exit,
    }

    Appender!(Movie[]) _pendingDelete;

    void displayRange(R)(R range) {
        import std.range : walkLength;

        if(range.empty) {
            write("\nSorry, there are no movies in the database that match your query.");
            return;
        }

        auto len = range.walkLength();
        writefln("\nFound %s matches.", len);

        foreach(ref movie; range) {
            if(!displayMovie(movie, --len >= 1))
                break;
        }
        writeln("\nThat was the last movie in the list.");
    }

    bool displayMovie(ref Movie movie, bool showNext = false) {
        static choices = [
            "edit this movie",
            "delete this movie",
            "display the next movie"
        ];

        printMovie(movie);
        auto choiceText = showNext ? choices : choices[0 .. $-1];
        auto choice = readChoice(choiceText);

        if(choice == 1) {
            editMovie(movie);
            return displayMovie(movie, showNext);
        }
        else if(choice == 2) {
            _pendingDelete ~= movie;
            writefln("\nMovie '%s' scheduled for deletion.", movie.title);
            return showNext;
        }
        else if(choice != 3) return false;

        return true;
    }

    void editMovie(ref Movie movie) {
        enum skipIt = "skip it";
        auto title = "";
        auto msg = "No changes committed to the database.";
        uint caseNumber, pageNumber;

        scope(exit) {
            writeln("\n", msg);
            writeln("Press 'Enter' to continue.");
            readUint();
        }

        if(readChoice("to edit the movie's title", skipIt)) {
            title = readTitle();
            if(!validateTitle(title))
                return;
        }

        if(readChoice("to edit the movie's case number", skipIt)) {
            caseNumber = readNumber("case");
            if(!validateNumber(caseNumber, "case"))
                return;
        }

        if(readChoice("to edit the movie's page number", skipIt)) {
            pageNumber = readNumber("page");
            if(!validateNumber(pageNumber, "page"))
                return;
        }

        if(title != "") movie.title = title;
        if(caseNumber > 0) movie.caseNumber = caseNumber;
        if(pageNumber > 0) movie.pageNumber = pageNumber;
        msg = "Database updated.";
    }

protected:
    override void handleSelection(uint selection) {
        final switch(cast(Options)selection) with(Options) {
            case byTitle:
                auto movies = readTitle.getMovies();
                displayRange(movies);
                break;
            case allOnPage:
                auto caseNumber = readNumber("case");
                auto pageNumber = readNumber("page");
                auto movies = getMovies(caseNumber, pageNumber);
                displayRange(movies);
                break;
            case allInCase:
                auto movies = readNumber("case").getMovies();
                displayRange(movies);
                break;
            case all:
                auto movies = getMovies();
                displayRange(movies);
                break;
            case exit:
                exitMenu();
                break;
        }

        if(_pendingDelete.data.length > 0) {
            deleteMovies(_pendingDelete.data);
            _pendingDelete.clear();
        }
    }
public:
    this() {
        auto options = [
            "Display Movie by Title",
            "Display All Movies on a Page",
            "Display All Movies in a Case",
            "Display All Movies",
            "Return to Main Menu"
        ];
        super("Choose a display option.", options);
    }
}