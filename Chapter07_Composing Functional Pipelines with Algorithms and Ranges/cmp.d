
void main() {
    import std.algorithm : cmp;
    auto s1 = "Michael";
    auto s2 = "Michel";
    assert(cmp(s1, s2) < 0);
}