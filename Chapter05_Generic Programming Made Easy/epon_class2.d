import std.stdio;

class HashMap(K,V) {
private:
    V[K] _map;
    string _name;
    this(string name) {
        _name = name;
    }
}

void main() {
    auto map = new HashMap!(string, int)("NamesMap");
    writeln(map._name);
}