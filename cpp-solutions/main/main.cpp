#include <iostream>
#include <vector>
#include <exception>
#include "slns0kto1k.h"

static const int target = 9;

int main()
{
  std::cout << "LeetCode Solutions Runner" << "\n";
  try {
    const std::vector<int> inp = { 2, 7, 11, 15 };
    const std::vector<int> res = twoSum(inp, target);
    printVector(res);
    return 0;
  } catch (const std::exception &e) {
    std::cerr << "Error: " << e.what() << "\n";
    return 1;
  }
}