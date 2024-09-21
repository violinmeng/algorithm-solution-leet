#include <iostream>

using namespace std;

int hammingWeight(int n) {
    int bits = 0;
    int mask = 1;
    for (int i = 0; i < 32; i++) {
        if ((n & mask) != 0) {
            bits++;
        }
        mask <<= 1;
    }
    return bits;
}

int hammingWeight_opt(uint32_t n) {
    int ans = 0;
    while (n > 0) {
        ans ++;
        n = n & (n-1);
    }

    return ans;
}


int main () {

    cout << hammingWeight(3) << endl;

    return 0;
}