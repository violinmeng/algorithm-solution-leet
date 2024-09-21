#include <iostream>
#include <string>
#include <vector>
using namespace std;

/**
 * DP: fn = max(fn-1 + nums[i], nums[i])
*/
static int maxSubArray(vector<int>& nums) {
    int pre=0, ans = nums[0];
    for (const auto &x : nums)
    {
        pre = max(pre + x, x);
        ans = max(pre, ans);
    }
    return ans;
}

/**
 * 分治类似于【线段树求解最长公共上升子序列问题】
 * lSum: max sum of sub array which start from left index
 * rSum: max sum of sub array which end with right index
 * mSum: max sum of sub array
 * iSum: sum of array
*/

struct Status {
    int lSum, rSum, mSum, iSum;
}

Status pushUp(Status l, Status r) {
    int iSum = l.iSum + r.iSum;
    int lSum = max(l.lSum, l.iSum + r.lSum);
    int rSum = max(r.rSum, r.iSum + l.rSum);
    int mSum = max(max(l.mSum, r.mSum), l.rSum + r.lSum);
    return (Status){lSum, rSum, mSum, iSum};
}

Status get(vector<int> &nums, int l, int r) {
    if (l == r)
    {
        return (Status){a[l], a[l], a[l], a[l]};
    }
    int m = (l + r) >> 1;
    Status lStatus = get(nums, l, m);
    Status rStatus = get(nums, m+1, r);
    return pushUp(lStatus, rStatus);
}

int maxSubArray_1(vector<int> &nums) {
    return get(nums, 0, nums.size() - 1).mSum;
}


int main()
{
    vector<int> vec{-2,1,-3,4,-1,2,1,-5,4};
    cout << maxSubArray(vec) << endl;
    return 0;
}
