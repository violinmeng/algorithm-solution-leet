import Base

public func addTwoNumbers(_ link1: ListNode?, _ link2: ListNode?) -> ListNode? {
    let head = ListNode() // this is a placeholder node, to ease the logic pain.
    var tail = head

    var ptr1 = link1
    var ptr2 = link2

    var carry = 0

    while ptr1 != nil || ptr2 != nil {
        let val1 = ptr1?.val ?? 0
        let val2 = ptr2?.val ?? 0

        let sum = val1 + val2 + carry

        let node = ListNode(sum % 10)
        carry = sum / 10 // update carry

        tail.next = node
        tail = tail.next! // keep node moving on, we just set next, so we use the bang op to force unwrapping.

        ptr1 = ptr1?.next
        ptr2 = ptr2?.next
    }

    if carry > 0 {
        tail.next = ListNode(carry)
        tail = tail.next!
    }

    return head.next
}
