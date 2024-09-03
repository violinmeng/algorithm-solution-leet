
public func grayCode(_ n: Int) -> [Int] {
    if n == 0 {
        return [0]
    }
    var ans = [0]
    for i in 1...n {
        var tmp = ans
        tmp.reverse()
        ans += tmp.map { $0 | (1 << (i - 1)) }
    }
    return ans
}

public func grayCodeV2(_ n: Int) -> [Int] {
    var res = Array(repeating: 0, count: 1<<n)
    for i in 0..<(1<<n) {
        res[i] = i>>1^i
    }
    return res
}
