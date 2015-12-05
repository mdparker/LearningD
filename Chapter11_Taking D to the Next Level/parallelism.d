struct Vec2 {
    float x = 1.0f, y = 2.0f;
}
void main() {
    import std.stdio : writeln;
    import std.datetime : MonoTime;
    auto vecs = new Vec2[](100_000_000);
    auto before = MonoTime.currTime;
    version(SingleThread) {
        foreach(ref vec; vecs) {
            vec.x *= 2.0f;
            vec.y *= 2.0f;
        }
    }
    else {
        import std.parallelism : parallel;        
        foreach(ref vec; parallel(vecs)) {
            vec.x *= 2.0f;
            vec.y *= 2.0f;
        }
    }
    writeln(MonoTime.currTime - before);
}
