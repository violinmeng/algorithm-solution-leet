#include <iostream>
#include <vector>
#include <unordered_map>

//clang++ -std=c++11 -stdlib=libc++ -Weverything 0001-twosum.cpp
/*
Input: 1->1->2->3->3
Output: 1->2->3
*/
using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};

//这个没有使用排序这个条件，性能表现不够好；
ListNode* deleteDuplicates(ListNode* head) {

    if (head == nullptr) return head;
    unordered_map<int, bool> map;
    ListNode *cur = head;
    ListNode *pre = NULL;
    while (cur)
    {
        if (map.find(cur->val) != map.end()) {
            pre->next = cur->next;
            delete cur;
            cur = pre->next;
        } else {
            map[cur->val] = true;
            pre = cur;
            cur = cur->next;
        }
    }
    return head;
}

ListNode* deleteDuplicatesRecommand(ListNode* head) {

    if (head != nullptr) {
        ListNode *cur = head;
        while (cur->next)
        {
            if (cur->next->val == cur->val) {
                ListNode *next = cur->next;
                cur->next = cur->next->next;
                delete next;
            } else {
                cur = cur->next;
            }
        }
    }
    
    return head;
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
    
    vector<int> vec = {1,1,2};
    ListNode *l1 = constructList(vec);

    pintList(l1);
    pintList(deleteDuplicates(l1));

    return 0;
}



