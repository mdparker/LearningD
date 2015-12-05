import std.stdio;

void main() {
    import std.range : sequence, take, dropOne;  
    auto r = sequence!("n*2").dropOne.take(10);
    foreach(i; r) writeln(i);
}