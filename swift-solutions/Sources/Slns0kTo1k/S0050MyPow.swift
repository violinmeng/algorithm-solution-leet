// to make it as fast as possible, we can solve it with the bisection method
// it is easy to implement it with recursive function.
func myPow(_ base: Double, _ exp: Int) -> Double {
    if exp == 0 {
        return 1
    }

    let negative: Bool = exp > 0 ? false : true
    let isOdd = exp & 1 == 1
    let temp = myPow(base, abs(exp) / 2)
    var res: Double = temp * temp
    if isOdd {
        res *= base
    }
    return negative ? 1 / res : res
}

// the iterate version solution is more memory efficiency.
func myPowIterate(_ base: Double, _ exp: Int) -> Double {
    var absexp = exp < 0 ? -exp : exp
    var iter = base
    var ans: Double = 1
    while absexp != 0 {
        if (absexp & 1) != 0 {
            ans *= iter
        }
        absexp >>= 1
        iter *= iter
    }
    return exp < 0 ? 1 / ans : ans
}
