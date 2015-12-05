import std.stdio;

class Player {
    enum MaxLevel = 50;
    private int _level;
    int level() { return _level; }
    void levelUp() { 
        ++_level;
        if(_level > MaxLevel) 
            _level = MaxLevel; 
    }
    invariant {
        assert(_level >= 0 && _level <= MaxLevel);
    }
}

void main() {
    auto p = new Player;
    p.levelUp();
    writeln(p.level);
}