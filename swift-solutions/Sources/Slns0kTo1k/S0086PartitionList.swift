import Base

public func partition(_ head: ListNode?, _ threshold: Int) -> ListNode? {
    var lessHead: ListNode?
    var lessCur: ListNode?
    var greatHead: ListNode?
    var greatCur: ListNode?
    var iter = head
    while let cur = iter {
        if cur.val < threshold {
            if lessHead == nil {
                lessHead = cur
                lessCur = cur
            } else {
                lessCur?.next = cur
                lessCur = cur
            }
        } else {
            if greatHead == nil {
                greatHead = cur
                greatCur = cur
            } else {
                greatCur?.next = cur
                greatCur = cur
            }
        }
        iter = iter?.next
    }

    if lessHead == nil {
        return greatHead
    }

    greatCur?.next = nil
    lessCur?.next = greatHead

    return lessHead
}
