// the dividend = a1 * divisor * 2^k + a2 * divisor * 2^(k-1) + ... ak *divisor * 2 + ak+1 * divisor + remainder
// and for each of those a1,...ak+1 is 0 or 1.
// so the answer is a1 a2 .. ak+1 in binary.

// There are several things we need to pay attention to.
// First, we need to deal with those results which will cause overflow.
//
// Second, the negative range is more wider than the positive range.
// to ease the complexity of solution, we convert the dividend and divisor to negative range.
// and proceed to solution.

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == Int(Int32.min) {
        if divisor == -1 {
            return Int(Int32.max)
        } else if divisor == 1 {
            return Int(Int32.min)
        }
    }

    if divisor == Int(Int32.min) {
        return dividend == Int(Int32.min) ? 1 : 0
    }

    if divisor == 0 {
        return 0
    }

    var rev = false
    var dividend = dividend
    var divisor = divisor
    if dividend > 0 {
        dividend = -dividend
        rev = !rev
    }
    if divisor > 0 {
        divisor = -divisor
        rev = !rev
    }

    var candidates: [Int] = [divisor]

    while let last = candidates.last, last >= dividend - last {
        candidates.append(last << 1)
    }

    var ans = 0
    for idx in stride(from: candidates.count - 1, to: -1, by: -1) where candidates[idx] >= dividend {
        ans += 1 << idx
        dividend -= candidates[idx]
    }

    return rev ? -ans : ans
}
