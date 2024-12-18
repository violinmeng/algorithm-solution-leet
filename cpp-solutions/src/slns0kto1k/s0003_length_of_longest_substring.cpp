#include "slns0kto1k.h"
#include <algorithm>
#include <array>
#include <string>
/*
无重复字符的最长子串
 滑动窗口；
 左边要为前一个出现字符串出现的坐标和当前左边坐标较大值
 一个字符没有出现，那么上次出现的位置为0；
 第一个字符出现的位置为 1，以此类推；
*/
using namespace std;

static const int ascii_size = 128;

int lengthOfLongestSubstring(const string &str)
{
  // 这里用做一个字典，记录一个字母，上次出现的位置
  array<int, ascii_size> map = { 0 };

  int ans = 0;
  int left = 0;
  for (int right = 0; right < str.size(); right++) {
    left = max(left, map.at(static_cast<unsigned char>(str[right])));
    map.at(static_cast<unsigned char>(str[right])) = right + 1;
    ans = max(ans, right - left + 1);
  }
  return ans;
}
