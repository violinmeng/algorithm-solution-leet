#include <iostream>
#include <string>
using namespace std;

int strStr(string haystack, string needle) {
    int m = haystack.length(), n = needle.length();

    if (n == 0) return 0;

    for (int i = 0; i < m - n + 1; i++) {
        for (int j = 0; j < n; j++) {
            if (haystack[i+j] != needle[j]) break;
            if (j == n-1) return i;
        }
    }
    return -1;
}

//kmp need implement

int main () {
    
    cout << strStr("hello", "ll") << endl;

    return 0;
}