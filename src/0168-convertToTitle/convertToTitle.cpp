#include <iostream>
#include <string>

using namespace std;


string convertToTitle(int n) {
    string res;
    while(n > 0) {
        int x = n % 26;
        if (x == 0) {
            x = 26;
            n -= 26;
        }
        char c = 'A'+ x - 1;
        res = string(1,c) + res;
        n /= 26;
    }
    return res;
}

int main()
{
    cout << convertToTitle(52) << endl;
    cout << convertToTitle(26) << endl;
    cout << convertToTitle(701) << endl;
    return 0;
}