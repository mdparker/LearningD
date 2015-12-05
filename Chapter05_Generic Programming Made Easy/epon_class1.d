import std.stdio;

class ValClass(T) {
private:
    T _val;
public:
    this(T val) {
        _val = val;
    }
    T val() @property {
        return _val;
    }
}

void main() {
    auto vc = new ValClass!int(10);
    writeln(vc.val);
}