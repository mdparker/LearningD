enum usePlatformPrefix = true;
string makeID(string s, string suffix = null) {
    static if(usePlatformPrefix) {
        version(Windows) enum prefix = "WIN_ID_";
        else enum prefix = "NIX_ID_";
    }
    else enum prefix = "ID_";
    auto ret = prefix ~ s;
    ret ~= suffix;
    return ret;
}

enum ID : string {
    one = makeID("One"),
    oneEx = makeID("One", "Ex"),
}
pragma(msg, ID.one);
pragma(msg, ID.oneEx);

void main() {}