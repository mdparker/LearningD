
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
    One = makeID("One"),
    OneEx = makeID("One", "Ex"),
}

void main() {}