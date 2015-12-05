import std.stdio;

void main() {
    import std.array : assocArray;
    import std.algorithm : group;
    auto arr = [1, 1, 1, 2, 2, 3, 3, 3, 3, 4];
    auto aa = arr.group().assocArray();
    writefln("The number 3 appears %s times.", aa[3]);
}