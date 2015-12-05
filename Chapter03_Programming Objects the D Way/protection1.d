module protection1;

import std.stdio; // private, only visible in this module

class MyClass {
	void sayHello() { writeln("Hello"); }
}

struct MyStruct {
	void sayHello() { writeln("Hello");; }
}

