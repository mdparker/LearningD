struct ModMe {
    int x;
}

struct ModMeHolder {
    ModMe mm;
}

void main() {
    immutable ModMe mm;
    immutable(ModMe)* pmm;
    mm.x = 1;   // Error
    pmm.x = 2;  // Error

    immutable ModMeHolder mmh;
    mmh.mm.x = 1;   // Error
}
