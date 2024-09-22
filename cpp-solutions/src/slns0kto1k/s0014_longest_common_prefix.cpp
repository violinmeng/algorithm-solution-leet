#include <iostream>
#include <string>
#include <vector>

using namespace std;

string longestCommonPrefix(vector<string> &strs)
{
  if (strs.size() == 0) return "";

  string ans = strs[0];

  for (int i = 1; i < strs.size(); i++) {
    ans = longestCommonPrefix(ans, strs[i]);
    if (ans.empty()) { return ans; }
  }

  return ans;
}

string longestCommonPrefix(string s1, string s2)
{
  int index = 0;
  int size = min(s1.size(), s2.size());
  for (index = 0; index < size; index++) {
    if (s1[index] != s2[index]) { break; }
  }
  return s1.substr(0, index);
}

// 纵向扫描，取第一个字符，查看每个字符串是不是有这个字符，知道有不同的字符，以及到某个字符串结尾
// 分治,longestCommonPrefix(strs,left,right)辅助函数，比较分治两部分的结果
//      用string longestCommonPrefix(string s1, string s2)类似的函数；
// 二分法，找到最短字符串，二分法该长度，用纵向扫描确定是不是有相同的字符；

int main()
{
  vector<string> strs = { "flow", "flower", "flex" };
  cout << longestCommonPrefix(strs) << endl;
  return 0;
}