#include "base/LinkedList.h"
#include <memory>

// clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
*/
using namespace std;
using namespace base;

static const int ten = 10;
// 不能改变l1.因为对于改变调用方不正确
// 用一个虚拟头节点可以简化代码的逻辑
// 虚拟节点记得要有delete否则会有内存泄漏
// 判断l1=null，返回l2严格来说有问题，因为这个函数返回一个新创建的链表；
LinkedList<int> addTwoNumbers(const LinkedList<int> &list1, const LinkedList<int> &list2)
{
  ListNode<int> *ptr1 = list1.getHead();
  ListNode<int> *ptr2 = list2.getHead();
  LinkedList<int> res;

  int carry = 0;
  while (ptr1 != nullptr || ptr2 != nullptr) {
    const int x = ptr1 != nullptr ? ptr1->val : 0;
    const int y = ptr2 != nullptr ? ptr2->val : 0;
    const int sum = x + y + carry;
    res.append(sum % ten);
    carry = sum / ten;
    if (ptr1 != nullptr) { ptr1 = ptr1->next.get(); }
    if (ptr2 != nullptr) { ptr2 = ptr2->next.get(); }
  }

  if (carry > 0) { res.append(carry); }
  return res;
}
