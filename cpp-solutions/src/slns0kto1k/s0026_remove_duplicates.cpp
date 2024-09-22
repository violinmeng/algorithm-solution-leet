#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

int removeDuplicates(vector<int> &nums)
{

  int size = nums.size();
  if (size == 0) return 0;

  int i = 0;

  for (int j = 1; j < size; j++) {
    if (nums[j] != nums[i]) {
      i++;
      nums[i] = nums[j];
    }
  }

  return i + 1;
}

int main()
{
  vector<int> nums = { 1, 1, 2 };
  int idx = removeDuplicates(nums);
  cout << idx << endl;
  for_each(nums.begin(), nums.begin() + idx, [](const int i) { cout << i << " "; });
  cout << endl;
  return 0;
}