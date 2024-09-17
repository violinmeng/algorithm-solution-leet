class LRUCache {
    class LinkNode {
        var val = 0
        var key: Int = 0
        var next: LinkNode?
        var pre: LinkNode?

        init() {}

        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }

    var capacity = 0
    var cacheDict: [Int: LinkNode]
    var dummyHead: LinkNode
    var dummyTail: LinkNode

    init(_ capacity: Int) {
        self.capacity = capacity
        cacheDict = Dictionary(minimumCapacity: capacity)
        dummyHead = LinkNode()
        dummyTail = LinkNode()
        dummyHead.next = dummyTail
        dummyTail.pre = dummyHead
    }

    func get(_ key: Int) -> Int {
        defer {
            print(cacheDict)
        }
        if let node = cacheDict[key] {
            moveToHead(node)
            return node.val
        } else {
            return -1
        }
    }

    func put(_ key: Int, _ value: Int) {
        defer {
            print(cacheDict)
        }
        if let node = cacheDict[key] {
            node.val = value
            moveToHead(node)
        } else {
            let node = LinkNode(key, value)
            addToHead(node)
            cacheDict[key] = node
            if cacheDict.count > capacity {
                if let tail = removeTail() {
                    cacheDict.removeValue(forKey: tail.key)
                }
            }
        }
    }

    func moveToHead(_ node: LinkNode) {
        removeNode(node)
        addToHead(node)
    }

    func addToHead(_ node: LinkNode) {
        let head = dummyHead.next
        node.next = head
        head?.pre = node
        dummyHead.next = node
        node.pre = dummyHead
    }

    func removeTail() -> LinkNode? {
        if dummyTail.pre !== dummyHead, let tail = dummyTail.pre {
            removeNode(tail)
            print(tail.val)
            return tail
        }
        return nil
    }

    func removeNode(_ node: LinkNode) {
        let prenode = node.pre
        prenode?.next = node.next
        node.next?.pre = prenode
        node.next = nil
        node.pre = nil
    }
}

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

class CmdInterpreter {
    enum Cmd: String {
        case LRUCache
        case get
        case put
        case unkown
    }

    var cmds: [Cmd] = []
    var arguments: [[Int]] = []

    init(cmds: [String], arguments: [[Int]]) {
        self.cmds = cmds.map { Cmd(rawValue: $0) ?? .unkown }
        self.arguments = arguments
    }

    func proceed() -> [String] {
        var cache: LRUCache?
        var outputs: [String] = []
        for (index, cmd) in cmds.enumerated() {
            switch cmd {
            case .LRUCache:
                if let arg = arguments[safe: index], arg.count == 1 {
                    cache = LRUCache(arg.first!)
                    outputs.append("null")
                }
            case .get:
                if let arg = arguments[safe: index], arg.count == 1 {
                    if let res = cache?.get(arg.first!) {
                        outputs.append(String(res))
                    }
                }
            case .put:
                if let arg = arguments[safe: index], arg.count == 2 {
                    cache?.put(arg.first!, arg.last!)
                    outputs.append("null")
                }
            default:
                print("unknown command")
            }
        }
        return outputs
    }
}
