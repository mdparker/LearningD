import std.stdio;

auto inc(int x) { return ++x; }

void main() {
    auto n1 = 2.inc;
    auto n2 = n1.inc();
    writeln(n1);
    writeln(n2);

    auto n3 = 2.inc.inc.inc.inc.inc;
    writeln(n3);
}