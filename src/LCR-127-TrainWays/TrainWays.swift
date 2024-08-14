// same as 0070 climb stairs problem.
// but here need to consider the result for the zero case.
// and when the result number is too large, we need to modulo it.
func trainWays(_ num: Int) -> Int {
    
    if num <= 1 {
        return 1
    }

    var f1 = 1
    var f2 = 1
    var tmp = f2
    for i in 2...num {
        f2 = (f1 + f2) % 1000000007
        f1 = tmp
        tmp = f2
    }
    return f2
}

print(trainWays(95))