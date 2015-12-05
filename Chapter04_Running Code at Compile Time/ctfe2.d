string makeID(string s, string suffix = null) {
    return "ID_" ~ s ~ suffix;
}

enum ID : string {
    one = makeID("One"),
    oneEx = makeID("One", "Ex"),
}
pragma(msg, ID.one);
pragma(msg, ID.oneEx);

void main() {}