extern(C) @nogc nothrow void printThreeInts(int*);
extern(C) @nogc nothrow void storeThreeInts(int*);
extern(C) @nogc nothrow void printIntArrays(size_t, int**, size_t*);
extern(C) @nogc nothrow size_t getIntList(int**);
void main() {
    import std.stdio : writeln;

    int[] ints = [1, 2, 3];
    printThreeInts(cast(int*)ints);
    printThreeInts(ints.ptr);

    auto threeInts = new int[](3);
    storeThreeInts(threeInts.ptr);
    writeln(threeInts);

    auto fourInts = [10, 20, 30, 40];
    auto fourIntsSize = fourInts.length;
    auto pfi = fourInts.ptr;
    printIntArrays(cast(size_t)1, &pfi, &fourIntsSize);

    auto intArrays = [[10, 20, 30], [1, 3, 5, 7, 9], [100, 101]];
    auto ptrs = new int*[](3);
    auto sizes = new size_t[](intArrays.length);
    foreach(i, ia; intArrays) {
        ptrs[i] = ia.ptr;
        sizes[i] = ia.length;
    }
    printIntArrays(intArrays.length, ptrs.ptr, sizes.ptr);

    int* pi;
    auto size = getIntList(&pi);
    auto intList = pi[0 .. size];
    writeln(intList);
}