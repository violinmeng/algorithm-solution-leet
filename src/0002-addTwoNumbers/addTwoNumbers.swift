// listNode defined in the BaseSwift/LinkList.swift
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var head = ListNode() // this is a placeholder node, to ease the logic pain.
    var tail = head

    var li1 = l1
    var li2 = l2

    var carry:Int = 0;

    while (li1 != nil || li2 != nil) {
        var v1 = li1?.val ?? 0;
        var v2 = li2?.val ?? 0;

        var sum = v1 + v2 + carry;

        var node = ListNode(sum % 10)
        carry = sum / 10 // update carry

        tail.next = node;
        tail = tail.next! // keep node moving on, we just set next, so we use the bang op to force unwrapping.

        li1 = li1?.next
        li2 = li2?.next
    }
    
    if carry > 0 {
        tail.next = ListNode(carry)
        tail = tail.next!
    }

    return head.next
}

// test code
let l1 = LinkList([2,4,3])
let l2 = LinkList([5,6,4])
print(LinkList(addTwoNumbers(l1, l2)))