import std.stdio;

void main() {
    auto array = [10,20,30,40,50];
EXIT_LOOPS:
    for(int i=0; i<array.length; ++i) {
        for(int j=array.length - 1; j>=0; --j) {
            auto val = array[i] + array[j];
            if(val == 100) break EXIT_LOOPS;
            writeln(val);
        }
    }
}