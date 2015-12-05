import std.stdio;

void main() {
    int x = 10;
    switch(x) {
        case 2:
            writeln("It's 2!");
            break;
        case 4:
            writeln("It's 4!");
            break;
        case 10:
            writeln("It's 10!");
            break;
        default:
            writeln("It's something else!");
            break;
    }

    string s = "Yadda Yadda";
    switch(s) {
        case "Yadda": writeln("One Yadda"); break;
        case "Yadda Yadda": writeln("Two Yaddas"); break;
        default: break;
    }

}