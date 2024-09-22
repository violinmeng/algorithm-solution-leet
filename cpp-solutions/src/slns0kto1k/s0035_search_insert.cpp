#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;
// 二分查找；
// le < ri 说明跳出循环的时候le=ri
// 那么le，ri的取值范围0-（size-1）
// num[le]是安全的。

// lower_bound(nums.begin(),nums.end(),target) - nums.begin()
// 其实也是通过二分查找；
int searchInsert(vector<int> &nums, int target)
{
  // return lower_bound(nums.begin(),nums.end(),target) - nums.begin();

  int le = 0, ri = nums.size() - 1;

  while (le < ri) {
    int mid = (le + ri) / 2;
    if (nums[mid] == target) {
      return mid;
    } else if (nums[mid] < target) {
      le = mid + 1;
    } else {
      ri = mid - 1;
    }
  }

  return nums[le] < target ? le + 1 : le;
}

int main()
{
  vector<int> vec = { 1, 3, 5, 6 };
  cout << searchInsert(vec, 7) << endl;
  return 0;
}