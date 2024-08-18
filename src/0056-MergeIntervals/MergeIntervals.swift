func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard let first = intervals.first else {
        return intervals
    }

    var ans: [[Int]] = [first]

    for idx in 1..<intervals.count {
        var cur = intervals[idx]
        var tmp: [[Int]] = []
        for aidx in 0..<ans.count {
            let item = ans[aidx]
            if let curFirst = cur.first, let curLast = cur.last, let itemFirst = item.first, let itemLast = item.last {
                if curFirst >= itemFirst && curFirst <= itemLast {
                    cur = [itemFirst, max(curLast, itemLast)]
                } else if itemFirst >= curFirst && itemFirst <= curLast {
                    cur = [curFirst, max(curLast, itemLast)]
                } else {
                    tmp.append(item)
                }
            }
        }
        tmp.append(cur)
        ans = tmp
    }
    return ans

}

func merge1(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else { return intervals }
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var merged: [[Int]] = [sortedIntervals[0]]
    for i in 1..<sortedIntervals.count {
        let cur = sortedIntervals[i]
        let last = merged.last!
        if cur[0] <= last[1] {
            var last = merged.removeLast()
            last[1] = max(last[1], cur[1])
            merged.append(last)
        } else {
            merged.append(cur)
        }
    }
    return merged
}

print(merge([[1,3],[2,6],[8,10],[15,18]]))
print(merge([[2,3],[4,5],[1,4],[15,18]]))

print(merge1([[1,3],[2,6],[8,10],[15,18]]))
print(merge1([[2,3],[4,5],[1,4],[15,18]]))