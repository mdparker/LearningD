import std.stdio;
import movieman.io;
void main() {
    auto title = readTitle();
    writeln("The title is: ", title);

    auto number = readNumber("page");
    writeln("The number is: ", number);

    auto bchoice = readChoice("continue", "abort");
    writeln("You chose to: ", bchoice ? "continue" : "abort");

    auto choices = ["Eat Pizza", "Sleep", 
        "Watch 'Game of Thrones'", "Play Skyrim"];
    auto uichoice = readChoice(choices, "do nothing");
    if(uichoice == 0)
        writeln("You chose to do nothing.");
    else
        writeln("You chose to ", choices[uichoice-1]);

    printList("What do you feel like doing?", choices);
    uichoice = readUint();
    writeln("You chose option #", uichoice);
}