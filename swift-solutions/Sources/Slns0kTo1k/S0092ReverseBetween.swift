import Base

public func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    let dummyHead = ListNode(0)
    dummyHead.next = head

    var pre: ListNode? = dummyHead
    for _ in 0 ..< left - 1 {
        pre = pre?.next
    }

    let cur: ListNode? = pre?.next
    for _ in 0 ..< right - left {
        let next = cur?.next
        cur?.next = next?.next
        next?.next = pre?.next
        pre?.next = next
    }

    return dummyHead.next
}
