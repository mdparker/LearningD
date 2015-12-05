module priv;
private struct Priv {
    int x, y;
}
Priv makeAPriv(int x, int y) {
    return Priv(x, y);
}
