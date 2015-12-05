import std.stdio;

void main() {
    writeln(r"I'm a WYSIWYG string'```'\t\n");
    writeln(`me, too!\n\r"'''""`);
    writeln(r"I'm a WYSIWYG string'```'\t\n");
    writeln(`me, too!\n\r"'''""`);
    writeln(r"I'm a WYSIWYG string'```'\t\n");
    writeln(`me, too!\n\r"'''""`);
    auto s = q"STR
I'm a string with a custom delimiter!
STR";
    writeln(s);
    writeln(q{
    int x = 10;
    int y = 1;
    });

}