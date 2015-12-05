import std.stdio;

void main() {
    int[] a1 = new int[10];
    writeln(a1.ptr);
    int[] a2 = [0,1,2,3,4,5,6,7,8,9];
    a1[] = a2;
    writeln(a1.ptr);
    a1 = a2.dup;
    writeln(a1.ptr);

    int[10] sa1 = 10;
    sa1[] = 100;
    writeln(sa1);

    int[] a = [2,3,4];
    a[] ^^= 2;
    writeln(a);
    int[] b = [5,6,7];
    int[3] c = a[] + b[];
    writeln(c);

    auto ea1 = [1,2,3];
    auto ea2 = [1,2,3];
    writeln(ea1 == ea2);
    writeln(ea1 is ea2);

}