import Base

func insertionSortList(_ head: ListNode?) -> ListNode? {
    var dummyHead = ListNode()
    dummyHead.next = head
    // two pointer, cur points to the selected node, pre points the previous one.
    var pre = head
    var cur = head?.next

    while cur != nil {
        var ptr: ListNode? = dummyHead

        // visit from head to pre, find the insert position.
        while ptr !== cur {
            if let pval = ptr?.next?.val, let curval = cur?.val, pval > curval {
                // we find the position, and remove cur node from list
                pre?.next = cur?.next
                // then insert to the found position.
                cur?.next = ptr?.next
                ptr?.next = cur
                break
            } else {
                ptr = ptr?.next
            }
        }

        if ptr === cur {
            // this means the cur do not change the position. so pre need move forward.
            pre = pre?.next
        }
        cur = pre?.next
    }

    return dummyHead.next
}
