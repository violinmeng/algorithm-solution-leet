public func longestContinuousSubstring(_ str: String) -> Int {
    if str.isEmpty {
        return 0
    }
    var result = 1
    var current = 1
    let chars = Array(str)
    for idx in 1 ..< chars.count {
        if let pre = chars[idx - 1].asciiValue, let cur = chars[idx].asciiValue {
            if Int(cur) - Int(pre) == 1 {
                current += 1
                result = max(result, current)
            } else {
                current = 1
            }
        }
    }
    return result
}
