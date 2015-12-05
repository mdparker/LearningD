module inherit;

import std.stdio;

class Simpleton {}

class Babbler {
    protected string genMessage() {
        return "De do do do. De da da da.";
    }
    override string toString() {
        import std.format : format;
        return format("%s says: %s", super.toString(),
            genMessage());
    }
}

class Elocutioner : Babbler {
    protected override string genMessage() {
        return super.genMessage() ~
            " That's all I want to say to you.";
    }
}

void babble(Babbler babbler) {
    writeln(babbler);
}

void main() {
    writeln(new Simpleton);
    writeln(new Babbler);
    babble(new Elocutioner);
}