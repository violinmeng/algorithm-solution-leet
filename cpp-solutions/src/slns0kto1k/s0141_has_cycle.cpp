#include <iostream>


using namespace std;

struct ListNode
{
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(nullptr) {}
};

bool hasCycle(ListNode *head)
{
  ListNode *p = head;
  ListNode *q = head ? head->next : nullptr;

  while (p && q) {
    if (p == q) return true;
    p = p ? p->next : nullptr;
    q = (q && q->next) ? q->next->next : nullptr;
  }

  return false;
}

int main()
{
  ListNode *test1 = new ListNode(1);
  cout << (hasCycle(test1) ? "Yes" : "No") << endl;
  ListNode *test2 = new ListNode(1);
  ListNode *node1 = new ListNode(2);
  test2->next = node1;
  node1->next = test2;
  cout << (hasCycle(test1) ? "Yes" : "No") << endl;
  return 0;
}