#include <iostream>
#include <string>
#include <map>

using namespace std;

const string thousands[] = {"", "M", "MM", "MMM"};
const string hundreds[]  = {"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"};
const string tens[]      = {"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"};
const string ones[]      = {"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"};

class Solution {
public:
    string intToRoman(int num) {
        return thousands[num / 1000] + hundreds[num % 1000 / 100] + tens[num % 100 / 10] + ones[num % 10];
    }
};


string intToRoman(int num) {
    
    map<int, string> map = {
        {1, "I"},
        {4, "IV"},
        {5, "V"},
        {9, "IX"},
        {10, "X"},
        {40, "XL"},
        {50, "L"},
        {90, "XC"},
        {100, "C"},
        {400, "CD"},
        {500, "D"},
        {900, "CM"},
        {1000,"M"}
    };
    string ans;
    while (num > 0)
    {
        for (auto map_rit = map.rbegin(); map_rit != map.rend(); ++map_rit) {
            if (num >= map_rit->first) {
                ans += map_rit->second;
                num -= map_rit->first;
                break;
            }
        }
    }
    return ans;
}

int main() {
    // cout << intToRoman(1994) << endl;
    int i = 42;
    int &r1 = i;
    const int &r2 = i;
    r1 = 0;
    cout << r1 << r2 << endl;
    return 0;
}