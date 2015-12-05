import std.stdio;

version(Windows) {
    pragma(msg, "We are compiling on a Windows system.");
}
else version(OSX) {
    pragma(msg, "We are compiling on a Mac OS X system.");
}
else version(Posix) {
    pragma(msg, "We are compiling on a Posix system.");
}

void main() {
    version(Windows) {
        string rtmsg = "Hello on a Windows system!";
    } else {
        string rtmsg = "Hello on a non-Windows system!";
    }
    writeln(rtmsg);
}