module protection2;

import std.stdio; // private, only visible in this module

class MyClass {
	private void sayHello() { writeln("Hello"); }
}

struct MyStruct {
	void sayHello() { 
        MyClass mc = new MyClass;
        mc.sayHello();   
    }
}

