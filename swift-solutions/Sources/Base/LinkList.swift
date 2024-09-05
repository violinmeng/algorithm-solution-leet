public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { val = 0
        next = nil
    }

    public init(_ val: Int) { self.val = val
        next = nil
    }

    public init(_ val: Int, _ next: ListNode?) { self.val = val
        self.next = next
    }
}

public class LinkList {
    public var head: ListNode?
    public init(head: ListNode? = nil) {
        self.head = head
    }

    public init(with array: [Int]) {
        head = linkList(with: array)
    }

    public func linkList(with array: [Int]) -> ListNode? {
        var current: ListNode?
        var following: ListNode?
        for item in array.reversed() {
            current = ListNode(item)
            current?.next = following
            following = current
        }
        return current
    }

    public static func from(array: [Int]) -> LinkList {
        return LinkList(with: array)
    }
}

extension LinkList: CustomStringConvertible {
    public var description: String {
        var pointer = head
        var desc = "link list: "
        while pointer != nil {
            if pointer !== head {
                desc += " -> "
            }
            if let val = pointer?.val {
                desc += "\(val)"
            } else {
                desc += "nil"
            }
            pointer = pointer?.next
        }
        return desc
    }
}

extension LinkList: Equatable {
    public static func == (lhs: LinkList, rhs: LinkList) -> Bool {
        var pointerl = lhs.head
        var pointer2 = rhs.head
        while pointerl != nil && pointer2 != nil {
            if pointerl!.val != pointer2!.val {
                return false
            }
            pointerl = pointerl?.next
            pointer2 = pointer2?.next
        }
        if pointerl == nil && pointer2 == nil {
            return true
        }
        return false
    }
}
