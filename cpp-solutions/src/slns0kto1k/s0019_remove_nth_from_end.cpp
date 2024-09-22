#include <iostream>

using namespace std;

struct ListNode
{
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
};

// 可以利用stack，记录倒数第n个节点
// 可以先得到长度，然后进行遍历；

ListNode *removeNthFromEnd(ListNode *head, int n)
{
  if (n <= 0) return head;
  ListNode *slow = head;
  ListNode *fast = head;

  for (int i = 0; i < n - 1; i++) { fast = fast ? fast->next : nullptr; }

  if (!fast) return head;
  if (!fast->next) {
    ListNode *res = head->next;
    delete head;
    return res;
  }

  fast = fast->next;

  while (fast->next) {
    fast = fast->next;
    slow = slow->next;
  }

  ListNode *todel = slow->next;
  slow->next = todel->next;
  delete todel;
  return head;
}

ListNode *removeNthFromEnd_dummyHead(ListNode *head, int n)
{
  ListNode *dummy = new ListNode(0, head);
  ListNode *first = head;
  ListNode *second = dummy;
  for (int i = 0; i < n; ++i) { first = first->next; }
  while (first) {
    first = first->next;
    second = second->next;
  }
  second->next = second->next->next;
  ListNode *ans = dummy->next;
  delete dummy;
  return ans;
}


int main() { return 0; }