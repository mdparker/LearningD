#include <stdio.h>
#ifdef _MSC_VER
__declspec(dllexport)
#endif
int some_c_function(int a) {
    printf("Hello, D! From C! %d\n", a);
    return a + 20;
}