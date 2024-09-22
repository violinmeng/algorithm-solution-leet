#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

vector<vector<int>> subsets(vector<int> &nums)
{

  vector<vector<int>> ans;
  int size = nums.size();

  for (int i = 0; i < (1 << size); i++) {
    vector<int> sub;
    for (int j = 0; j < size; j++) {
      if ((i >> j) & 1) { sub.push_back(nums[j]); }
    }
    ans.push_back(sub);
  }

  return ans;
}

int main()
{

  vector<int> inp = { 1, 2, 3 };

  vector<vector<int>> res = subsets(inp);
  cout << "[" << endl;
  for_each(res.begin(), res.end(), [](const vector<int> sub) {
    cout << "\t[";
    for_each(sub.begin(), sub.end(), [](const int i) { cout << i << ','; });
    cout << "]," << endl;
  });
  cout << ']' << endl;

  return 0;
}