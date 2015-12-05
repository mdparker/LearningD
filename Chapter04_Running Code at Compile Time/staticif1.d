import std.stdio;

version(Windows) {
    enum sysWindows = true;
    enum sysLinux = false;
}
else version(linux) {
    enum sysWindows = false;
    enum sysLinux = true;
}
else {
    enum sysWindows = false;
    enum sysLinux = false;
}

void main() {
    static if(sysWindows || sysLinux) {
        writeln("Windows or Linux!");
    }
    else {
        writeln("Neither Windows nor Linux!");
    }
}