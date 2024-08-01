#include <iostream>
#include <vector>
#include <string>

//clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
无重复字符的最长子串
 滑动窗口；
 左边要为前一个出现字符串出现的坐标和当前左边坐标较大值
 一个字符没有出现，那么上次出现的位置为0；
 第一个字符出现的位置为 1，以此类推；
*/
using namespace std;

int lengthOfLongestSubstring(string s) {
    // 这里用做一个字典，记录一个字母，上次出现的位置
    int m[128] = {0};

    int ans = 0;
    int lo = 0;
    int size = s.size();
    for (int hi = 0; hi < size; hi++)
    {
        lo = max(lo, m[s[hi]]);
        m[s[hi]] = hi+1;
        ans = max(ans, hi-lo+1);
    }
    return ans;
}

int main ()
{
    string s = "pwkeabw";
    // p hi=0 lo=0 m[p]=0 ans=1
    // w hi=1 lo=0 m[p]=0 m[w]=1, ans=2

    int length = lengthOfLongestSubstring(s);

    cout << length << endl;
    
}
