import Base

public func mergeNodes(_ head: ListNode?) -> ListNode? {
    guard validNodes(head) else {
        return nil
    }
    var cur = head
    var ptr = head?.next

    var sum = 0
    while let lptr = ptr {
        if lptr.val == 0 {
            cur?.val = sum
            cur?.next = lptr.next != nil ? lptr : nil
            cur = lptr
            sum = 0
        } else {
            sum += lptr.val
        }
        ptr = ptr?.next
    }

    return head
}

func validNodes(_ head: ListNode?) -> Bool {
    guard let head else {
        return false
    }
    var ptr = head
    while let next = ptr.next {
        ptr = next
    }
    return ptr.val == 0
}
