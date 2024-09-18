// fibonacci number sequence
func climbStairs(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }

    var fun1 = 1
    var fun2 = 1
    var tmp = fun2
    for _ in 2 ... num {
        fun2 = (fun1 + fun2)
        fun1 = tmp
        tmp = fun2
    }
    return fun2

    // return climbStairs(n-1) + climbStairs(n-2)
}
