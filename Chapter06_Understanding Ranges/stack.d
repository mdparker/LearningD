import std.stdio;
struct Stack(T) {
    private T[] _array;

    private struct Range {
        T[] _elements;
        bool empty() { return _elements.length == 0; }
        T front() { return _elements[$-1]; }
        void popFront() { _elements.length -= 1; }
    }

    auto elements() { return Range(_array); }

    void push(T element) {
        _array ~= element;
    }

    void pop() {
        assert(!isEmpty);
        _array.length -= 1;
    }

    ref T top() {
        assert(!isEmpty);
        return _array[$-1];
    }

    bool isEmpty() { return _array.length == 0; }
}

void main() {
    Stack!int stack;
    foreach(i; 0..10)
        stack.push(i);
    writeln("Iterating...");
    foreach(i; stack.elements)
        writeln(i);
    stack.pop();
    stack.pop();
    writeln("Iterating...");
    foreach(i; stack.elements) 
        writeln(i);
    writeln(stack.top);
}