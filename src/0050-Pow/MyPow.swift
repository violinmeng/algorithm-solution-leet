
// to make it as fast as possible, we can solve it with the bisection method
// it is easy to implement it with recursive function.
func myPow(_ x: Double, _ n: Int) -> Double {
    
    if n == 0 {
        return 1
    }

    let negative: Bool = n > 0 ? false : true
    let isOdd = n & 1 == 1
    let temp = myPow(x, abs(n) / 2)
    var res:Double = temp * temp
    if isOdd {
        res *= x
    }
    return negative ? 1 / res : res
}

// the iterate version solution is more memory efficiency.
func myPowIterate(_ x: Double, _ n: Int) -> Double {
    var m = n < 0 ? -n : n
    var t = x
    var ans:Double = 1
    while m != 0 {
        if (m & 1) != 0 {
            ans *= t
        }
        m >>= 1
        t = t * t
    }
    return n < 0 ? 1/ans : ans
}

print(myPow(2.00000, 10))
print(myPowIterate(2.00000, 10))