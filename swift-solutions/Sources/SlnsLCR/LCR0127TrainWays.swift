// same as 0070 climb stairs problem.
// but here need to consider the result for the zero case.
// and when the result number is too large, we need to modulo it.
public func trainWays(_ num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    var fun1 = 1
    var fun2 = 1
    var tmp = fun2
    for _ in 2...num {
        fun2 = (fun1 + fun2) % 1000000007
        fun1 = tmp
        tmp = fun2
    }
    return fun2
}
