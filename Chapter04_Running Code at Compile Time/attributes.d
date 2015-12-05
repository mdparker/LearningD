import std.stdio;
struct NoPrint {}
struct NoSave {}
enum Decoration {
    none,
    italics,
    bold,
}
struct Decorated {
    Decoration decoration;
}
struct Data {
    @Decorated(Decoration.bold) string name;
    @Decorated(Decoration.italics) string occupation;
    @NoSave @NoPrint int temporary;
}
void main() {
    foreach(member; __traits(allMembers, Data)) {
        enum name = "Data." ~ member;
        writef("Attributes of %s: ", name);
        
        foreach(attr; __traits(getAttributes, mixin(name))) {
            static if(is(typeof(attr) == Decorated)) {
                Decoration dec = 
                    __traits(getMember, attr, "decoration");
                writef("Decoration.%s", dec);
            } else {
                writef(" %s", attr.stringof);
            }
        }
        writeln();
    }

    import std.traits : hasUDA;
    static if(hasUDA!(Data.temporary, NoSave))
        writeln("Data.temporary can't be saved!");
}
