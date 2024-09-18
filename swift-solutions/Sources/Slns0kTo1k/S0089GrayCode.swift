public func grayCode(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var ans = [0]
    for iter in 1 ... num {
        var tmp = ans
        tmp.reverse()
        ans += tmp.map { $0 | (1 << (iter - 1)) }
    }
    return ans
}

public func grayCodeV2(_ num: Int) -> [Int] {
    var res = Array(repeating: 0, count: 1 << num)
    for idx in 0 ..< (1 << num) {
        res[idx] = idx >> 1 ^ idx
    }
    return res
}
