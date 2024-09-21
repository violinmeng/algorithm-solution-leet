#include <iostream>
#include <unordered_map>
#include <vector>

#include "slns0kto1k.h"


/**
 * given a array with a bunch of numbers and a target numbers
 * find the indexs of the two numbers which num
 */

using namespace std;

vector<int> twoSum(const vector<int> &nums, const int target)
{
  unordered_map<int, int> map;

  for (int i = 0; i < nums.size(); i++) {
    auto iterator = map.find(target - nums[i]);
    if (iterator != map.end()) { return { iterator->second, i }; }
    map[nums[i]] = i;
  }

  return {};
}

void printVector(const vector<int> &vec)
{
  for (auto &&idx : vec) { cout << idx << ' '; }
  cout << '\n';
}
