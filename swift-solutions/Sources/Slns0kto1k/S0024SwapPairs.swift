import Base

func swapPairsRecursive(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }

    var newHead = head?.next
    head?.next = swapPairsRecursive(head?.next?.next)
    newHead?.next = head
    return newHead
}

func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }

    var dummy = ListNode(0)
    dummy.next = head
    var prev = dummy
    var current = head

    while let letcur = current, let next = current?.next {
        letcur.next = next.next
        next.next = current
        prev.next = next
        prev = letcur
        current = current?.next
    }

    return dummy.next
}
