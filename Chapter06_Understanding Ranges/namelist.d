import std.stdio;

struct NameList {
private:
    string[] _firstNames;
    string[] _lastNames;
    struct Generator {
        private string[] _first;
        private string[] _last;
        private string _next;
        enum empty = false;
        this(string[] first, string[] last) {
            _first = first;
            _last = last;
            popFront();
        }
        string front() {
            return _next;
        }
        void popFront() {
            import std.random : uniform;
            auto firstIdx = uniform(0, _first.length);
            auto lastIdx = uniform(0, _last.length);
            _next = _first[firstIdx] ~ " " ~ _last[lastIdx];
        }
    }
public:
    auto generator() {
        return Generator(_firstNames, _lastNames);
    }
}

void main() {
    auto nameList = NameList(
    ["George", "John", "Paul", "Ringo", "Bob", "Jimi",
     "Waylon", "Willie", "Johnny", "Kris", "Frank", "Dean",
     "Anne", "Nancy", "Joan", "Lita", "Janice", "Pat",
     "Dionne", "Whitney", "Donna", "Diana"],
    ["Harrison", "Jones", "Lennon", "Denver", "McCartney",
     "Simon", "Starr", "Marley", "Dylan", "Hendrix", "Jennings",
     "Nelson", "Cash", "Mathis", "Kristofferson", "Sinatra",
     "Martin", "Wilson", "Jett", "Baez", "Ford", "Joplin",
     "Benatar", "Boone", "Warwick", "Houston", "Sommers",
     "Ross"]
    );
    import std.range : take;
    auto names = nameList.generator.take(4);
    writeln("These artists want to form a new band:");
    foreach(artist; names)
        writeln(artist);
}