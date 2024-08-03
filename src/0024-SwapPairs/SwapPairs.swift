
func swapPairsRecursive(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }

    var newHead = head?.next
    head?.next = swapPairs(head?.next?.next)
    newHead?.next = head
    return newHead
}

// test code
print(LinkList(swapPairsRecursive(LinkList([1,2,3,4]))))