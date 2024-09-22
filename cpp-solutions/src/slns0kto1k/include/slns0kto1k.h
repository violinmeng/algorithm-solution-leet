#pragma once
#include "base/ListNode.h"
#include <string>
#include <vector>

std::vector<int> twoSum(const std::vector<int> &nums, const int target);
void printVector(const std::vector<int> &vec);

base::LinkedList<int> addTwoNumbers(const base::LinkedList<int> &l1, const base::LinkedList<int> &l2);

int lengthOfLongestSubstring(const std::string &str);