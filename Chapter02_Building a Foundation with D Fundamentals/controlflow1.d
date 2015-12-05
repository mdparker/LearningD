import std.stdio;

void main() {
    auto items = [10,20,30,40,50];
    for(int i=0; i<items.length; ++i)
        writeln(items[i]);

    int i;
    while(i < items.length)
        writeln(items[i++]);

    i = 0;
    do {
        writeln(items[i++]);
    } while(i < items.length);
}