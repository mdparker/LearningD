auto getIt() {
    struct Priv {
        int x;
    }
}

struct PrivHolder {
    typeof(getIt()) priv;
}

void main() {
    PrivHolder.priv = getIt();
}