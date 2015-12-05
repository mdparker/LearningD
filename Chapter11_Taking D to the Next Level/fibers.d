import core.thread;
import std.stdio;
void myFiberFunc() {
    writeln("Execution begun.");
    Fiber.yield();
    writeln("Execution resumed.");
}
void main() {
    auto fiber = new Fiber(&myFiberFunc);
    fiber.call();
    writeln("Execution paused.");
    fiber.call();
}