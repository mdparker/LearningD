module movieman.menu.display;

import std.stdio;
import movieman.io,
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

protected:
    override void handleSelection(uint selection) {
        final switch(cast(Options)selection) with(Options) {
            case byTitle:
                auto title = readTitle();
                writeln("Displaying ", title);
                break;
            case allOnPage:
                auto caseNumber = readNumber("case");
                auto pageNumber = readNumber("page");
                writefln("Displaying all on page %s of case %s", 
                    pageNumber, caseNumber);
                break;
            case allInCase:
                auto caseNumber = readNumber("case");
                writeln("Displaying all in case ", caseNumber);
                break;
            case all:
                writeln("Displaying all movies.");
                break;
            case exit:
                exitMenu();
                break;
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