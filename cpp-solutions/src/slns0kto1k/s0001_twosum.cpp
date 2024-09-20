#include <iostream>
#include <unordered_map>
#include <vector>

#include "slns0kto1k.h"

// clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
 * Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].

*/

/**
 * given a array with a bunch of numbers and a target numbers
 * find the indexs of the two numbers which num
 */

using namespace std;

vector<int> twoSum(vector<int> &nums, int target)
{
  unordered_map<int, int> map;

#pragma unroll 3
  for (int i = 0; i < nums.size(); i++)
  {
    auto iterator = map.find(target - nums[i]);
    if (iterator != map.end())
    {
      return { iterator->second, i };
    }
    map[nums[i]] = i;
  }

  return {};
}

void printVector(vector<int> &vec)
{
#pragma unroll 3
  for (auto &&idx : vec)
  {
    cout << idx << ' ';
  }
  cout << '\n';
}
