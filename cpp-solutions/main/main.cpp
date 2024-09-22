#include "base/ListNode.h"
#include "slns0kto1k.h"
#include <exception>
#include <iostream>
#include <vector>

static const int target = 9;

int main()
{
  try {
    const std::vector<int> inp = { 2, 7, 11, 15 };
    const std::vector<int> res = twoSum(inp, target);
    printVector(res);

    const base::LinkedList<int> list1 = { 2, 4, 3 };
    const base::LinkedList<int> list2 = { 5, 6, 4 };
    list1.print();
    list2.print();
    addTwoNumbers(list1, list2).print();

    std::cout << lengthOfLongestSubstring("pwkeabw") << "\n";

    return 0;
  } catch (const std::exception &e) {
    std::cerr << "Error: " << e.what() << "\n";
    return 1;
  }
}