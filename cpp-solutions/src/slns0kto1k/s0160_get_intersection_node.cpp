#include <iostream>

using namespace std;

typedef struct ListNode
{
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(nullptr) {};
} ListNode;

// double pointer
// 也可以通过两次循环比较实现；
// 通过一个字典记录一个链表中所有的元素，然后用另一个链表查找；
// map中可以用指针作为key的。
ListNode *getIntersectionNode(ListNode *headA, ListNode *headB)
{
  if (!headA || !headB) return nullptr;

  ListNode *pa = headA;
  ListNode *pb = headB;

  while (pa != pb) {
    pa = pa ? pa->next : headB;
    pb = pb ? pb->next : headA;
  }

  return pa;
}

void printNode(ListNode *node)
{
  if (node) {
    cout << node->val << endl;
  } else {
    cout << "null" << endl;
  }
}

int main()
{
  ListNode *node1 = new ListNode(1);
  ListNode *node2 = new ListNode(2);
  ListNode *node3 = new ListNode(3);
  node1->next = node2;
  node2->next = node3;

  ListNode *l1 = node1;

  ListNode *node4 = new ListNode(4);
  ListNode *node5 = new ListNode(5);

  node4->next = node5;
  node5->next = node2;

  ListNode *l2 = node4;

  ListNode *node6 = new ListNode(6);

  ListNode *res1 = getIntersectionNode(l1, l2);
  ListNode *res2 = getIntersectionNode(node6, nullptr);
  ListNode *res3 = getIntersectionNode(nullptr, node6);

  printNode(res1);
  printNode(res2);
  printNode(res3);
}