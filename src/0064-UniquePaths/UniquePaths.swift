// we got the recursive function: f(m,n) = f(m-1,n) + f(m,n-1)
// and f(x,0) = f(0,y) = 1
// so we can get the answer by the dynamic programming approach.
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
    for i in 1..<m {
        for j in 1..<n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    return dp[m-1][n-1]
    
}

// by looking at the dp matrix, f(m,n) only relies on the the previous line and the element before current line.
// we can optimize it with rolling array, and reduces the complexity degree from n*n to n.
func uniquePaths1(_ m: Int, _ n: Int) -> Int {
    var cur = Array(repeating: 1, count: n)
    for i in 1..<m {
        for j in 1..<n {
            cur[j] += cur[j-1]
        }
    }
    return cur[n-1]
}

// we can also calculate the result with math directly.
// and that is factorial(m+n-2) / factorial(m-1) * factorial(n-1)
// remembering the variable may be overflow because of the intermediate factorial result.
// ans = (ans * y) / x
// we must calculate the product of ans and y, then divide x
// otherwise, if we get the quotient of dividing y by x first. the fractional part will lose.
// the answer is going to be wrong.

func uniquePaths2(_ m: Int, _ n: Int) -> Int {
    var ans: UInt64 = 1;
    var y = n
    for x in 1..<m {
        ans = (ans * y) / x
        y += 1
    }
    return Int(ans);
}

print(uniquePaths(23, 12))
print(uniquePaths1(23, 12))
print(uniquePaths2(23, 12))