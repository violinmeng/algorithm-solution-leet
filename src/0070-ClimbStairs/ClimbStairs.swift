
// fibonacci number sequence
func climbStairs(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }

    var f1 = 1
    var f2 = 1
    var tmp = f2
    for i in 2...num {
        f2 = (f1 + f2)
        f1 = tmp
        tmp = f2
    }
    return f2

    // return climbStairs(n-1) + climbStairs(n-2)
}

print(climbStairs(20))