#include <stdio.h>
#include <stdbool.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

int  NumberOf1(int n) {
    int num = 0;
    while (n!=0){
        n = n & (n-1);
        num++;
    }
    return num;
}

int main() {
//    int test[] = {2,3,1,0,2,5,3};
    printf("%d\n", NumberOf1(1));
    printf("%d\n", NumberOf1(3));


//    printf("%s: %d\n", is ? "Yes" : "No", duplication);

   return 0;
}
