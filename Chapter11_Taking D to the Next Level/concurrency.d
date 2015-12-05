import std.concurrency;
import std.stdio;
void myThreadFunc(Tid owner) {
    receive(
        (string s) { writefln("Message to thread %s: %s", owner, s); },
    );
}
void main() {
    auto child1 = spawn(&myThreadFunc, thisTid);
    auto child2 = spawn(&myThreadFunc, thisTid);
    send(child1, "Message for child1.");
    send(child2, "Message for child2.");
}
