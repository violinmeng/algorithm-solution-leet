import Base

func rotateRight(_ head: ListNode?, _ rotateIdx: Int) -> ListNode? {
    guard let head = head, head.next != nil, rotateIdx != 0 else {
        return head
    }

    var listLength = 1
    var iter: ListNode? = head
    while iter?.next != nil {
        iter = iter?.next
        listLength += 1
    }

    var counter = listLength - rotateIdx % listLength
    if counter == listLength {
        return head
    }
    iter?.next = head
    while counter > 0 {
        iter = iter?.next
        counter -= 1
    }

    let newHead = iter?.next
    iter?.next = nil
    return newHead
}
