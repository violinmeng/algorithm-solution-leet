#include <iostream>
#include <unordered_map>
#include <vector>

// clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
Given a sorted array nums, remove the duplicates in-place such that duplicates appeared at most twice and return the new
length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra
memory.

Example 1:

Given nums = [1,1,1,2,2,3],

Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3 respectively.

It doesn't matter what you leave beyond the returned length.
*/
using namespace std;

struct ListNode
{
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};
// 把不重复的数组，移动到数组最前端
int removeDuplicates(vector<int> &nums)
{
  int size = nums.size();
  if (size <= 2) return size;


  int i = 0;
  for (int n : nums) {
    if (i < 2 || n > nums[i - 2]) nums[i++] = n;
  }
  nums.erase(nums.begin() + (i - 1), nums.end());
  return i;
}

// 遇到重复的时候，把当前元素移除；
int removeDuplicates1(vector<int> &nums)
{
  int size = nums.size();
  if (size <= 2) return size;

  int idx = 2;
  while (idx < nums.size()) {
    if (nums[idx] == nums[idx - 2]) {
      nums.erase(nums.begin() + (idx - 1));
    } else {
      idx++;
    }
  }
  return nums.size();
}


int main()
{

  vector<int> vec = { 1, 1, 1, 2, 2, 3 };

  cout << removeDuplicates(vec) << endl;

  return 0;
}
