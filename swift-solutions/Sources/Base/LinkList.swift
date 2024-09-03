public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class LinkList {
    public var head:ListNode?
    
    public init(head: ListNode? = nil) {
        self.head = head
    }
    
    public init(with array:[Int]) {
        self.head = linkList(with: array)
    }
    
    public func linkList(with array:[Int]) ->ListNode? {
        var current:ListNode? = nil
        var following:ListNode? = nil
        for item in array.reversed() {
            current = ListNode(item)
            current?.next = following
            following = current
        }
        return current
    }
    
    public static func from(array:[Int]) -> LinkList? {
        return LinkList(with: array)
    }
    
}

extension LinkList: CustomStringConvertible {
    public var description: String {
        var p = head
        var desc = "link list: "
        while p != nil {
            if p !== head {
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
}

extension LinkList : Equatable {
    public static func == (lhs: LinkList, rhs: LinkList) -> Bool {
        var p1 = lhs.head
        var p2 = rhs.head
        while p1 != nil && p2 != nil {
            if p1!.val != p2!.val {
                return false
            }
            p1 = p1?.next
            p2 = p2?.next
        }
        if p1 == nil && p2 == nil {
            return true
        }
        return false
    }
}

