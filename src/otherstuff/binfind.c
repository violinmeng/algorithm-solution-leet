#include <stdio.h>
#include <stdbool.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

bool binfind(int a[], int length, int target) {
    
    if (length<=0) return false;
    
    int left = 0;
    int right = length-1;
    int middle = 0;
    while (right >= left) {
        middle = left + ((right - left)>>1);
        if (a[middle] == target) {
            return true;
        } else if (a[middle] > target) {
            right = middle - 1;
        } else {
            left = middle + 1;
        }
    }
    
    return false;
    
}


int main() {
    int test[] = {1,2,3,4,5,6};
    
    bool is = binfind(test,NELEMS(test),4);
    printf("is find %s: \n", is ? "Yes" : "No");
    
    is = binfind(test,NELEMS(test),7);    
    printf("is find %s: \n", is ? "Yes" : "No");

   return 0;
}

