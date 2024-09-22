#include <iostream>
#include <vector>

using namespace std;

vector<int> singleNumber(vector<int> &nums)
{
  int xorall = 0;
  for (auto &&i : nums) { xorall = xorall ^ i; }

  int mask = xorall & (-xorall);

  vector<int> ans;
  int a = 0, b = 0;
  for (auto &&i : nums) {
    if ((i & mask) == 0) {
      a ^= i;
    } else {
      b ^= i;
    }
  }

  ans.push_back(a);
  ans.push_back(b);

  return ans;
}

int main()
{
  vector<int> vec = { 1, 2, 1, 3, 2, 5 };
  vector<int> res = singleNumber(vec);
  cout << res[0] << " " << res[1] << endl;
  return 0;
}