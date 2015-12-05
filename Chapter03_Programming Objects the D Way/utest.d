int addInts(int a, int b) { return a + b; }
unittest {
    assert(addInts(10, 1) == 11);
    assert(addInts(int.max, 1) == int.min);
}
