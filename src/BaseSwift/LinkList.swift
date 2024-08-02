class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func linkList(with array:[Int]) ->ListNode? {
    
    var current:ListNode? = nil
    var following:ListNode? = nil
    for item in array.reversed() {
        current = ListNode(item)
        current?.next = following
        following = current
    }
    return current
}

func linkListDescription(_ linkList:ListNode?) -> String {
    var p = linkList
    var desc = "link list: "
    while p != nil {
        if p !== linkList {
            desc += " -> "
        }
        if let val = p?.val {
            desc += "\(val)"
        } else {
            desc += "nil"
        }
        p = p?.next
    }
    return desc
}

// print(linkListDescription(linkList(with: [1,2,3,4,5])))
