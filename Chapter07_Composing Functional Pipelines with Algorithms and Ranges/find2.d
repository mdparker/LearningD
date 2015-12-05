import std.stdio;
void main() {
    import std.algorithm : find;
    auto s = "Like Frankie said I did it my way.";
    auto r = s.find("Frankie");    
    if(!r.empty)    // s contains "Frankie"
        writeln(r);
}