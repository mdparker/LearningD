import std.stdio;
mixin(import("version.txt"));
void main() {
    writeln(appVersion);
    writeln(appVersionString);
}


