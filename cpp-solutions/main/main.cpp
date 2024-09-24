#include "base/ListNode.h"
#include "slns0kto1k.h"
#include "slns1kto2k.h"
#include <exception>
#include <iostream>
#include <vector>

static const int target = 9;

void main0kto1k()
{
  const std::vector<int> inp = { 2, 7, 11, 15 };
  const std::vector<int> res = twoSum(inp, target);
  printVector(res);

  const base::LinkedList<int> list1 = { 2, 4, 3 };
  const base::LinkedList<int> list2 = { 5, 6, 4 };
  list1.print();
  list2.print();
  addTwoNumbers(list1, list2).print();

  std::cout << lengthOfLongestSubstring("pwkeabw") << "\n";
}

void main1kto2k()
{
  const std::vector<int> vec = { 1, 2, 2, 1, 1, 3 };
  std::cout << (uniqueOccurrences(vec) ? "Yes" : "No") << "\n";

  const std::vector<int> vec1 = { 1, 2 };
  std::cout << (uniqueOccurrences(vec1) ? "Yes" : "No") << "\n";

  const std::vector<int> vec2 = { 1, 2, 3, 4, 5, 3, 1 };
  std::cout << findInMountainArray(3, vec2) << "\n";
}

int main()
{
  try {
    main0kto1k();
    main1kto2k();
    return 0;
  } catch (const std::exception &e) {
    std::cerr << "Error: " << e.what() << "\n";
    return 1;
  }
}