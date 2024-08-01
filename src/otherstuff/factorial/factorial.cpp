#include <iostream>
#include <string>
#include <vector>

using namespace std;
#define MAXCAP 3000
string factorial(int n) {

    vector<int> ans (MAXCAP,0);
    
    int carry = 0;

    ans[0] = 1;
    bool overflow = false;

    for (int i = 2; i <= n; i++) 
    {
        for (int j = 0; j <= MAXCAP; j++)
        {
            int tmp = ans[j] * i + carry;
            ans[j] = tmp % 10;
            carry = tmp / 10;
            if (j == MAXCAP && carry != 0)
            {
                overflow = true;
                // cout << carry << "---" << j << endl;
            }
            
        }
    }

    if (overflow)
    {
        return "the caculate is overflow";
    }
    int le = MAXCAP;
    while (ans[le] == 0)
    {
        le--;
    }

    string s;

    for (; le >= 0; le--)
    {
        s += to_string(ans[le]);
    }
    return s;
}


int main()
{
    cout << factorial(10) <<endl;
    cout << factorial(100) <<endl;
    cout << factorial(500) <<endl;
}
