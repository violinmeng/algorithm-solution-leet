#pragma once
#include "base/LinkedList.h"
#include <string>
#include <vector>
// 0001
std::vector<int> twoSum(const std::vector<int> &nums, const int target);
void printVector(const std::vector<int> &vec);

// 0002
base::LinkedList<int> addTwoNumbers(const base::LinkedList<int> &list1, const base::LinkedList<int> &list2);

// 0003
int lengthOfLongestSubstring(const std::string &str);

// 0007
int reverse(int x);

// 0012
std::string intToRomanV1(const int num);
std::string intToRoman(const int num);

// 0206
void iterateReverse(base::LinkedList<int> &list1);
// base::LinkedList<int> recusiveReverse(const base::LinkedList<int> &list1);
