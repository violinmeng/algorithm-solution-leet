class LRUCache {
    class LinkNode {
        var val = 0
        var key: Int = 0
        var next: LinkNode? = nil
        var pre: LinkNode? = nil
        
        init() {
        }
        
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
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

class CmdInterpreter {

    enum Cmd : String {
        case LRUCache = "LRUCache"
        case Get = "get"
        case Put = "put"
        case Unkown = "Unkown"
    }

    var cmds: [Cmd] = []
    var arguments: [[Int]] = []
    
    init(cmds: [String], arguments: [[Int]]) {
        self.cmds = cmds.map { Cmd(rawValue: $0) ?? .Unkown }
        self.arguments = arguments
    }

    func proceed() -> [String] {
        var cache:LRUCache? = nil
        var outputs: [String] = []
        for (index, cmd) in cmds.enumerated() {
            switch cmd {
            case .LRUCache:
                if let arg = arguments[safe: index], arg.count == 1 {
                    cache = LRUCache(arg.first!)
                    outputs.append("null")
                }
            case .Get:
                if let arg = arguments[safe: index], arg.count == 1 {
                    if let res = cache?.get(arg.first!) {
                        outputs.append(String(res))
                    }
                }
            case .Put:
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

let interperter = CmdInterpreter(cmds: ["LRUCache","put","put","get","put","get","put","get","get","get"], arguments: [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]])
print(interperter.proceed())
