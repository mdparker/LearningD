import std.stdio;

void main() {
    auto items = [10,20,30,40,50];

    foreach(it; items)
        writeln(it);

    foreach(it; 0..10)
        writeln(it);

    foreach(i,it; items)
        items[i] = it+10;

    foreach(ref it; items)
        it = it + 10;

    foreach(c; "soufflé")
        writeln(c);

    auto aa = ["One":1, "Two":2, "Three":3];
    foreach(key,val; aa)
        writefln("%s = %s", key, val);

}