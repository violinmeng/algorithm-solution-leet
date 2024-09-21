#include <iostream>
#include <vector>

using namespace std;


struct ListNode {
     int val;
     ListNode *next;
     ListNode(int x) : val(x), next(nullptr) {}
};

ListNode * constructList(vector<int> vec) {
    ListNode *dummy = new ListNode(0);
    ListNode *pre;
    for (auto &&i : vec)
    {
        ListNode * node = new ListNode(i);
        pre->next = node;
        pre = node;
    }

    ListNode *res = dummy->next;
    delete dummy;
    return res;
    
}

void printList(ListNode *head) {
    ListNode *p = head;
    while (p != NULL) {
        printf("%d -> ", p->val);
        p = p->next;
    }
    printf("\n");
}

ListNode* removeElements(ListNode* head, int val) {

    ListNode *pre = new ListNode(0);
    pre->next = head;
    ListNode *refn = pre;
    ListNode *cur = head;

    while (cur != nullptr) {
        if (cur->val == val) {
            pre->next = cur->next;
            delete cur;
            cur = pre->next;
        } else {
            cur = cur->next;
            pre = pre->next;
        }
    }

    ListNode * ans = refn->next;
    delete refn;
    return ans;

}

int main() {

    ListNode *head = constructList({1,2,6,3,4,5,6});
    printList(head);
    ListNode *filterList = removeElements(head, 6);
    printList(filterList);

    return 0;
}