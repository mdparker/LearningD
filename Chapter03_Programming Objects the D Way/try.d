import std.stdio;

void main() {
    import std.exception : ErrnoException;
    try {
        auto file = File("log.txt", "w");
        file.writeln("Hello, file!");
    }
    catch(ErrnoException ee) {
        // Do something specific to the ErrnoException
        writeln(ee);
    }
    catch(Exception e) {
        // Do something specific to the Exception
        writeln(e);
    }
    finally 
        writeln("Good bye!");
}