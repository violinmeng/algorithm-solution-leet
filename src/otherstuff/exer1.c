#include <stdio.h>
#include <stdbool.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))
int countRange(const int *num, int length, int start, int end);

bool check(const int *num, int length) {
    for (int i = 0; i < length; i++) {
        if (num[i] < 1 || num[i] > length-1 ) {
            return false;
        }
    }
    
    return true;
}

int getDuplicatedNums(const int *num, int length) {
    if (num == NULL || length <= 1 || !check(num,length)) return -1;
    
    int start = 1;
    int end = length -1;
    
    while (end >= start) {
        int middle = ((end - start)>>1) + start;
        
        int count = countRange(num,length,start,middle);
        
        if (start == end) {
            if (count > 0) {
                return start;
            }
            return -1;
        }
        
        if (count > middle - start + 1) {
            end = middle;
        } else {
            start = middle + 1;
        }
    }
    return -1;
}

int countRange(const int *num, int length, int start, int end) {
    if (num == NULL || length <= 0) {
        return 0;
    }
    int count = 0;
    for (int i = 0; i < length; i++) {
        if (num[i] >= start && num[i] <= end) {
            count++;
        }
    }
    
    return count;
}


int main() {
    int test[] = {2,3,5,4,3,2,6,7};

    int res = getDuplicatedNums(test, NELEMS(test));
    printf("duplite num is: %d\n",res);

   return 0;
}
