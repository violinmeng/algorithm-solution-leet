public func numSquares(_ num: Int) -> Int {
    var vec = Array(repeating: 0, count: num+1)

    for inc in 1...num {
        var minn = num
        var iter = 1
        while iter*iter <= inc {
            minn = min(minn, vec[inc - iter*iter])
            iter += 1
        }
        vec[inc] = minn + 1
    }

    return vec[num]
}
