public func reverseInt(_ input: Int) -> Int {
    // divide by 10, so the abs and result won't beyond the Int bounds.
    let tnum = input / 10
    let remainder = input % 10
    let isNegative = input < 0

    var num = abs(tnum)
    var result = 0
    var multipler = 1
    while num > 0 {
        result = result * 10 + num % 10
        num /= 10
        multipler *= 10
    }

    // restore the lowest digit to the highest position of result.
    if remainder != 0 {
        if isNegative {
            if remainder * multipler > Int(Int.min) + result {
                result = remainder * multipler - result
            } else {
                return Int.min
            }
        } else {
            if remainder * multipler < Int(Int.max) - result {
                result = remainder * multipler + result
            } else {
                return Int.max
            }
        }
    }

    return result
}
