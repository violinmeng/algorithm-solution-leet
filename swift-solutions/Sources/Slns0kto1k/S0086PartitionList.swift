//
//  File.swift
//  
//
//  Created by 王阿林 on 2024/9/3.
//

import Base

public func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    var lessHead:ListNode? = nil
    var lessCur:ListNode? = nil
    var greatHead:ListNode? = nil
    var greatCur:ListNode? = nil
    var iter = head
    while let cur = iter {
        if cur.val < x {
            if lessHead == nil {
                lessHead = cur
                lessCur = cur
            } else {
                lessCur?.next = cur;
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
        return  greatHead
    }

    greatCur?.next = nil
    lessCur?.next = greatHead

    return lessHead
}
