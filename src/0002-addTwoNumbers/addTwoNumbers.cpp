#include <iostream>
#include <vector>
#include <unordered_map>

//clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
*/
using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

//不能改变l1.因为对于改变调用方不正确
//用一个虚拟头节点可以简化代码的逻辑
//虚拟节点记得要有delete否则会有内存泄漏
//判断l1=null，返回l2严格来说有问题，因为这个函数返回一个新创建的链表；
ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
    ListNode *node = new ListNode(0);
    ListNode *p = l1;
    ListNode *q = l2;
    ListNode *cur = node;

    int carry = 0;
    while (p != nullptr || q != nullptr)
    {
        int x = p != nullptr ? p->val : 0;
        int y = q != nullptr ? q->val : 0;
        int sum = x + y + carry;
        cur->next = new ListNode(sum % 10);
        carry = sum / 10;
        cur = cur->next;
        if (p != nullptr) p = p->next;
        if (q != nullptr) q = q->next;
    }

    if (carry > 0)
    {
        cur->next = new ListNode(carry);
    }
    
    ListNode *res  = node->next;
    delete node;
    return res;
}


void pintList(ListNode *headList) {
    
    while (headList != NULL) {
        cout << headList->val << " -> ";
        headList = headList->next;
    }
    cout << endl;
}


ListNode * constructList(vector<int>& vec) {
    if (vec.size() <= 0) {
        return nullptr;
    }

    ListNode *head = new ListNode(vec[0]);
    
    ListNode *pre = head;
    
    for (int i = 1; i < vec.size(); i++) {
        ListNode *node = new ListNode(vec[i]);
        pre->next = node;
        pre = node;
    }
    
    return head;
    
}

int main () {
    
    vector<int> vec = {2,4,3};
    ListNode *l1 = constructList(vec);
    vector<int> vec1 = {5,6,4};
    ListNode *l2 = constructList(vec1);

    pintList(l1);
    pintList(l2);
    pintList(addTwoNumbers(l1,l2));

    return 0;
}



