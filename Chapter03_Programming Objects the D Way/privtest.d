import std.stdio;
import priv;
void main() {   
    auto priv = makeAPriv(10, 20);
    writeln(priv.x);
}
