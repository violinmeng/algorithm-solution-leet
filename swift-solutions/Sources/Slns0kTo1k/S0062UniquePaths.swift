// we got the recursive function: f(m,n) = f(m-1,n) + f(m,n-1)
// and f(x,0) = f(0,y) = 1
// so we can get the answer by the dynamic programming approach.
func uniquePaths(_ width: Int, _ height: Int) -> Int {
    var vec = Array(repeating: Array(repeating: 1, count: height), count: width)
    for idx in 1 ..< width {
        for jdx in 1 ..< height {
            vec[idx][jdx] = vec[idx - 1][jdx] + vec[idx][jdx - 1]
        }
    }
    return vec[width - 1][height - 1]
}

// by looking at the dp matrix, f(m,n) only relies on the the previous line and the element before current line.
// we can optimize it with rolling array, and reduces the complexity degree from n*n to n.
func uniquePaths1(_ width: Int, _ height: Int) -> Int {
    var cur = Array(repeating: 1, count: height)
    for _ in 1 ..< width {
        for idx in 1 ..< height {
            cur[idx] += cur[idx - 1]
        }
    }
    return cur[height - 1]
}

// we can also calculate the result with math directly.
// and that is factorial(m+n-2) / factorial(m-1) * factorial(n-1)
// remembering the variable may be overflow because of the intermediate factorial result.
// ans = (ans * y) / x
// we must calculate the product of ans and y, then divide x
// otherwise, if we get the quotient of dividing y by x first. the fractional part will lose.
// the answer is going to be wrong.

func uniquePaths2(_ width: Int, _ height: Int) -> Int {
    var ans: UInt64 = 1
    var height = UInt64(height)
    for idx in 1 ..< UInt64(width) {
        ans = ans * height / idx
        height += 1
    }
    return Int(ans)
}
