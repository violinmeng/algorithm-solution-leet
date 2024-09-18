// like insertion sort approach, take an interval from array at the index of i
// and merge with the intervals which have been merged.
// the interval may merge with serval intervals into one.
// we need take this case into count.
func merge(_ intervals: [[Int]]) -> [[Int]] {
    guard let first = intervals.first else {
        return intervals
    }

    var ans: [[Int]] = [first]

    for idx in 1 ..< intervals.count {
        var cur = intervals[idx]
        var tmp: [[Int]] = []
        for aidx in 0 ..< ans.count {
            let item = ans[aidx]
            if let curFirst = cur.first, let curLast = cur.last, let itemFirst = item.first, let itemLast = item.last {
                if curFirst >= itemFirst, curFirst <= itemLast {
                    // update the cur interval, and merge with the intervals afterwards if needed.
                    cur = [itemFirst, max(curLast, itemLast)]
                } else if itemFirst >= curFirst, itemFirst <= curLast {
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

// if we sort the interval by the starting value,
// the merging algorithm is going to be more intuitive and simple.
func merge1(_ intervals: [[Int]]) -> [[Int]] {
    guard intervals.count > 1 else {
        return intervals
    }
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    var merged: [[Int]] = [sortedIntervals[0]]
    for idx in 1 ..< sortedIntervals.count {
        let cur = sortedIntervals[idx]
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
