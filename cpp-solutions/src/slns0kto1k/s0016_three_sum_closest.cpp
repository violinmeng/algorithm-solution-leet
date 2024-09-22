#include <iostream>
#include <vector>

using namespace std;

int threeSumClosest(vector<int> &nums, int target)
{
  sort(nums.begin(), nums.end());

  int n = nums.size();

  int res = 1e7;// res-target should not overflow.

  auto update = [&](int cur) {
    if (abs(cur - target) < abs(res - target)) { res = cur; }
  };

  for (int first = 0; first < n; first++) {
    if (first > 0 && nums[first] == nums[first - 1]) { continue; }

    int second = first + 1;
    int third = n - 1;

    while (second < third) {
      int sum = nums[second] + nums[third] + nums[first];
      update(sum);
      if (sum < target) {
        int nsecond = second + 1;
        while (nsecond < third && nums[nsecond] == nums[second]) { nsecond++; }
        second = nsecond;


      } else if (sum > target) {

        int nthird = third - 1;
        while (second < nthird && nums[nthird] == nums[third]) { --nthird; }
        third = nthird;
      } else {
        return target;
      }
    }
  }

  return res;
}