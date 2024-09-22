#include <iostream>
#include <vector>

using namespace std;

int singleNumber(vector<int> &nums)
{
  int ans = 0;

  for (auto &&i : nums) { ans = ans ^ i; }

  return ans;
}

int main()
{
  vector<int> vec = { 4, 1, 2, 1, 2 };
  cout << singleNumber(vec) << endl;
  return 0;
}