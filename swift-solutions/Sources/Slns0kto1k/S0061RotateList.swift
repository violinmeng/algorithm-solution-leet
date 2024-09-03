//
//  File.swift
//  
//
//  Created by 王阿林 on 2024/9/3.
//

import Base

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let head = head, let _ = head.next, k != 0 else {
        return head
    }

    var n = 1;
    var iter: ListNode? = head
    while iter?.next != nil {
        iter = iter?.next
        n += 1
    }

    var counter = n - k % n
    if counter == n {
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
