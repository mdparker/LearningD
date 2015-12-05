module declscope;

int addTwo(int x) {
    return x + 2;
}

template NumTemplate() {
    enum constant = addTwo(10);
}