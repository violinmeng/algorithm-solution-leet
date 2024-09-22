#include <iostream>
#include <vector>

using namespace std;

typedef struct ListNode
{
  int val;
  ListNode *next;
  ListNode() : val(0), next(nullptr) {}
  ListNode(int x) : val(x), next(nullptr) {}
  ListNode(int x, ListNode *next) : val(x), next(next) {}
} ListNode;

// 用vector存储所有节点，然后通过idx访问连接；
void reorderList(ListNode *head)
{
  if (head == nullptr) { return; }

  vector<ListNode *> vec;
  ListNode *p = head;
  while (p) {
    vec.push_back(p);
    p = p->next;
  }

  int left = 0, right = vec.size() - 1;

  while (left < right) {
    vec[left]->next = vec[right];
    left++;
    if (left == right) { break; }


    vec[right]->next = vec[left];
    right--;
  }

  vec[right]->next = nullptr;
}

// 找到中间节点，把右侧的链表reverse。然后把两个链表merge；

void reorderList__(ListNode *head)
{
  if (head == nullptr) { return; }
  ListNode *mid = middleNode(head);
  ListNode *l1 = head;
  ListNode *l2 = mid->next;
  mid->next = nullptr;
  l2 = reverseList(l2);
  mergeList(l1, l2);
}

ListNode *middleNode(ListNode *head)
{
  ListNode *slow = head;
  ListNode *fast = head;
  while (fast->next != nullptr && fast->next->next != nullptr) {
    slow = slow->next;
    fast = fast->next->next;
  }
  return slow;
}

ListNode *reverseList(ListNode *head)
{
  ListNode *prev = nullptr;
  ListNode *curr = head;
  while (curr != nullptr) {
    ListNode *nextTemp = curr->next;
    curr->next = prev;
    prev = curr;
    curr = nextTemp;
  }
  return prev;
}

void mergeList(ListNode *l1, ListNode *l2)
{
  ListNode *l1_tmp;
  ListNode *l2_tmp;
  while (l1 != nullptr && l2 != nullptr) {
    l1_tmp = l1->next;
    l2_tmp = l2->next;

    l1->next = l2;
    l1 = l1_tmp;

    l2->next = l1;
    l2 = l2_tmp;
  }
}