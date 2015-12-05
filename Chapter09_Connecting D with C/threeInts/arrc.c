#include <stdio.h>

void printThreeInts(int *ints) {
    int i;
    for(i=0; i<3; ++i)
        printf("%i\n", ints[i]);
}

void storeThreeInts(int *ints) {
    int i;
    for(i=0; i<3; ++i)
        ints[i] = i+100;
}

size_t getIntList(int** parray) {
    static int localArray[3] = {10, 20, 30};
    *parray = localArray;
    return 3;
}

void printIntArrays(size_t count, int **arrays, size_t *sizes) {
    size_t i, j;
    for(i=0; i<count; ++i) {
        printf("Array #%d:\n", i + 1);
        for(j=0; j<sizes[i]; ++j)
            printf("\t%i\n", arrays[i][j]);
    }
}