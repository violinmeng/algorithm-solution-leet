func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    var newInterval: [Int]? = newInterval
    for interval in intervals {
        if let start = interval.first, let end = interval.last {
            if let newstart = newInterval?.first, let newend = newInterval?.last {
                // here we can list the conditional statements which imply the two intervals do not overlay first.
                // and make the if statements more clearly.
                // see the insert_opt implementation below.
                if newstart >= start, newstart <= end {
                    newInterval = [start, max(newend, end)]
                } else if newstart <= start, newend >= start {
                    newInterval = [newstart, max(newend, end)]
                } else {
                    if newend < start {
                        ans.append(newInterval!)
                        newInterval = nil
                    }
                    ans.append(interval)
                }
            } else {
                ans.append(interval)
            }
        }
    }
    if newInterval != nil {
        ans.append(newInterval!)
    }
    return ans
}

func insert_opt(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var ans: [[Int]] = []
    var newInterval: [Int]? = newInterval
    for interval in intervals {
        if let start = interval.first, let end = interval.last {
            guard let unwrapedNewInterval = newInterval else {
                ans.append(interval)
                continue
            }

            if let newstart = unwrapedNewInterval.first, let newend = unwrapedNewInterval.last {
                if newend < start {
                    ans.append(unwrapedNewInterval)
                    newInterval = nil
                    ans.append(interval)
                } else if newstart > end {
                    ans.append(interval)
                } else {
                    newInterval = [min(newstart, start), max(newend, end)]
                }
            }
        }
    }
    if let unwrapedNewInterval = newInterval {
        ans.append(unwrapedNewInterval)
    }
    return ans
}
