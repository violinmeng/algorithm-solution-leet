#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

//当进位的时候可以直接分配一个size+1的新数组，第一位置为1；
vector<int> plusOne(vector<int>& digits) {
    int carry = 1;
    
    for (int i = digits.size() -1 ; i >= 0 ; i--)
    {
        int tmp = digits[i] + carry;
        digits[i] = tmp % 10;
        carry = tmp /10;
        if (carry < 1) {
            break;
        }
    }

    if (carry > 0) {
        digits.insert(digits.begin(),carry);
    }

    return digits;
}

int main ()
{
    vector<int> v1 = {1,2,3};

    vector<int> res = plusOne(v1);
    for_each(res.begin(), res.end(), [](const int i) { cout << i << " ";});
    cout << endl;

    return 0;
}