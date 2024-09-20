#include <iostream>
#include "base/ListNode.h"
#include "../src/slns0kto1k/slns0kto1k.h"
// 包含其他必要的头文件

// 声明一些函数原型
// 例如: ListNode* addTwoNumbers(ListNode* l1, ListNode* l2);

int main() {
    std::cout << "LeetCode Solutions Runner" << std::endl;

    std::vector<int> inp = {2,7,11,15};
    int target = 9;
    std::vector<int> res = twoSum(inp, target);
    printVector(res);

    // 这里可以添加一些示例代码来调用解决方案
    // 例如:
    /*
    ListNode* l1 = new ListNode(2);
    l1->next = new ListNode(4);
    l1->next->next = new ListNode(3);

    ListNode* l2 = new ListNode(5);
    l2->next = new ListNode(6);
    l2->next->next = new ListNode(4);

    ListNode* result = addTwoNumbers(l1, l2);
    
    // 打印结果
    while (result) {
        std::cout << result->val << " ";
        result = result->next;
    }
    std::cout << std::endl;

    // 清理内存
    // ...
    */

    return 0;
}