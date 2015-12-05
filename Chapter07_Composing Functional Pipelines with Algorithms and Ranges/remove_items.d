import std.stdio;
int[] _items;
void removeItems(int[] ts) {
    import std.algorithm : find, canFind, copy, filter;
    auto dirty = _items.find!(m => ts.canFind(m));
    auto tail = dirty.filter!(m => !ts.canFind(m)).copy(dirty);
    _items = _items[0 .. $ - tail.length];
}
void main() {
    _items = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
    removeItems([20, 50, 90, 30]);
    writeln(_items);
}