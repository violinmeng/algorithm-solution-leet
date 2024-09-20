#include <iostream>
#include "base/ListNode.h"
#include "../src/slns0kto1k/slns0kto1k.h"

int main() {
    std::cout << "LeetCode Solutions Runner" << std::endl;
    std::vector<int> inp = {2,7,11,15};
    int target = 9;
    std::vector<int> res = twoSum(inp, target);
    printVector(res);
    return 0;
}