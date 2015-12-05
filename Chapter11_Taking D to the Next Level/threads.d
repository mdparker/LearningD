import core.thread;
import std.stdio;
class MyThread : Thread {
    this() {
        super(&run);
    }
    private void run() {
        writeln("MyThread is running.");
    }
}
void myThreadFunc() {
    writeln("myThreadFunc is running.");
}
void main() {
    auto myThread1 = new MyThread;
    auto myThread2 = new Thread(&myThreadFunc);
    myThread1.start();
    myThread2.start();
}