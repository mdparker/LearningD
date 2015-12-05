module movieman.menu.main;
import movieman.menu.menu;

final class MainMenu : Menu {
private:
    enum Options : uint {
        addMovie = 1u,
        displayMovie,
        exit,
    }
    Menu _displayMenu;

    void onAddMovie() {
        import movieman.db : Movie, addMovie;
        import movieman.io;
        import std.stdio : writeln;

        auto title = readTitle();
        if(!validateTitle(title))
            return;

        auto caseNumber = readNumber("case");
        if(!validateNumber(caseNumber, "case"))
            return;

        auto pageNumber = readNumber("page");
        if(!validateNumber(pageNumber, "page"))
            return;
        
        auto movie = Movie(title, caseNumber, pageNumber);
        printMovie(movie);

        if(readChoice("add this movie to the database"))
            addMovie(movie);
        else
            writeln("\nDiscarding new movie.");
    }

    void onDisplayMovie() {
        import movieman.menu.display : DisplayMenu;
        if(_displayMenu is null)
            _displayMenu = new DisplayMenu;
        _displayMenu.run();
    }

protected:
    override void handleSelection(uint selection) {
        final switch(cast(Options)selection) with(Options) {
            case addMovie:
                onAddMovie();
                break;
            case displayMovie:
                onDisplayMovie();
                break;
            case exit:
                exitMenu();
                break;
        }
    }

public:
    this() {
        auto options = [
            "Add Movie",
            "Display Movie(s)",
            "Exit"
        ];
        super("Select one of the following actions.", options);
    }
}