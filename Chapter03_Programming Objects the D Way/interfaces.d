import std.stdio;

interface Greeter {
    void greet();
}

class EnglishGreeter : Greeter {
    void greet() { writeln(this); }
    override string toString() { return "Hello"; }
}

void giveGreeting(Greeter greeter) {
    greeter.greet();
    // writeln(greeter); // Error!
}

interface Boomer {
    final string goBoom() { return "Boom!"; }
}

class BoomerImp : Boomer {
    override string toString() {
        return goBoom();
    }
}

void main() {
    giveGreeting(new EnglishGreeter);
    writeln(new BoomerImp);
}