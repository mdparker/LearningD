void main() {
    import std.algorithm : count;
    // How many 2s?
    auto arr1 = [1, 2, 3, 5, 2, 6, 3, 2];
    assert(arr1.count(2) == 3);
    // How many occurrences of "ke"?
    auto s = "Mike Parker";
    assert(s.count("ke") == 2);
    // How many even numbers?
    auto arr2 = [2, 3, 1, 4, 5, 10, 7];
    assert(arr2.count!("(a & 1) == 0") == 3);
}