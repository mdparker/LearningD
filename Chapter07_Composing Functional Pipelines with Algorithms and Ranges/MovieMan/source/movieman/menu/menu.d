module movieman.menu.menu;
import std.stdio;
import movieman.io;

class Menu {
private:
    string _header;
    string[] _items;
    bool _shouldExit;

protected:
    this(string header, string[] items) {
        _header = header;
        _items = items;
    }
 
    abstract void handleSelection(uint selection);

    void exitMenu() { _shouldExit = true; }

    bool validateTitle(string title) {
        if(title is null) {
            writeln("Empty title. Aborting.");
            return false;
        }
        return true;
    }

    bool validateNumber(uint number, string label) {
        if(number == 0) {
            writefln("%s numbers must be greater than 0. Aborting.", label);
            return false;
        }
        return true;
    }

public:
    final void run() {
        do {
            printList(_header, _items);
            auto selection = readUint();
            if(!selection || selection > _items.length)
                writefln("Sorry, that's an invalid selection. Please try again.");
            else
                handleSelection(selection);

        } while(!_shouldExit);
    }
}