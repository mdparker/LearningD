import std.stdio;

auto makeAPriv(int x, int y) {
	struct Priv {
		int x, y;
	}
	return Priv(x, y);
}

void main() {
	auto priv = makeAPriv(10, 20);
	writeln(priv.x);
}