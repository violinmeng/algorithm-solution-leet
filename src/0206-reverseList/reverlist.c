#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))

typedef struct ListNode {
    int key;
    struct ListNode * next;
} List;

List * constructList(int * arr, int length) {
    if (arr == NULL || length <= 0) {
        return NULL;
    }
    List* head = (List*)malloc(sizeof(List));
    head->key = arr[0];
    head->next = NULL;
    
    List * pre = head;
    
    for (int i = 1; i < length; i++) {
        List* node = (List*)malloc(sizeof(List));
        node->key = arr[i];
        node->next = NULL;
        pre->next = node;
        pre = node;
    }
    
    return head;
    
}

void pintList(List *headList) {
    
    while (headList != NULL) {
        printf("%d -> ", headList->key);
        headList = headList->next;
    }
    printf("\n");
}

List * iterate_reverse(List *head) {
    
    if (head == NULL || head->next == NULL) {
        return head;
    }
    
    List *pre = NULL;
    List *cur = head;
    List *next = NULL;
    while (cur != NULL) {
        next = cur->next;
        cur->next = pre;
        pre = cur;
        cur = next;
    }
    return pre;
}

List *recusiveReverse(List *head) {
    if (head == NULL || head->next == NULL) {
        return head;
    }
    
    List *rev = recusiveReverse(head->next);
    
    head->next->next = head;
    head->next = NULL;
    
    return rev;
    
    
}


int main() {
    int a[] = {1,2,3,4,5,6};
//    int a[] = {};

    
    List *head = constructList(a,NELEMS(a));
    
    pintList(head);
    List *tail = NULL;
//    pintList(recusiveReverse(head));
    pintList(iterate_reverse(head));

//    pintList(reverse(head));
    
    return 0;
    
}
