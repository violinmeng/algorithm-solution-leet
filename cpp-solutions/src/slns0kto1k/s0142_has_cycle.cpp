#include <iostream>


using namespace std;

struct ListNode
{
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(nullptr) {}
};

// can use hashtable to solve this problem;

ListNode *detectCycle(ListNode *head)
{
  ListNode *p = head;
  ListNode *q = head;
  while (q) {
    if (q && q->next) {
      q = q->next->next;
    } else {
      return nullptr;
    }

    p = p->next;

    if (p == q) {
      ListNode *ptr = head;
      while (ptr != p) {
        ptr = ptr->next;
        p = p->next;
      }
      return ptr;
    }
  }
  return nullptr;
}

int main()
{
  ListNode *test1 = new ListNode(1);
  // cout << (detectCycle(test1) ? "Yes" : "No") << endl;
  ListNode *test2 = new ListNode(1);
  ListNode *node1 = new ListNode(2);
  test2->next = node1;
  node1->next = test2;
  // cout << (hasCycle(test1) ? "Yes" : "No") << endl;
  return 0;
}