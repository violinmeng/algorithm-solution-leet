// respectively calculate the product of num1 and each single number in num2 in reverse order.
// and we get a number of product strings, and the count of strings is equal with the count of number in num2.
// we can make use of the solution of 0415 AddStrings, add those together.
// and we got the answer.
func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }

    var ans = "0"
    for (index2, char2) in num2.reversed().enumerated() {
        var cur = String(repeating: "0", count: index2)

        var charNum2 = char2.wholeNumberValue ?? 0
        var carry = 0

        for (index1, char1) in num1.reversed().enumerated() {
            var charNum1 = char1.wholeNumberValue ?? 0
            var result = charNum1 * charNum2 + carry
            cur += String(result % 10)
            carry = result / 10
        }
        if carry > 0 {
            cur += String(carry)
        }
        cur = String(cur.reversed())
        ans = addStrings(ans, cur)
    }

    return ans
}

func multiply2(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }

    let sumCount = num1.count + num2.count
    var res = Array(repeating: 0, count: sumCount)

    for (index1, char1) in num1.reversed().enumerated() {
        let charNum1 = char1.wholeNumberValue ?? 0

        for (index2, char2) in num2.reversed().enumerated() {
            let charNum2 = char2.wholeNumberValue ?? 0
            res[sumCount - 1 - index1 - index2] += charNum1 * charNum2
        }
    }

    var carry = 0
    for idx in stride(from: sumCount - 1, through: 0, by: -1) {
        let sum = res[idx] + carry
        res[idx] = sum % 10
        carry = sum / 10
    }

    var ans = ""
    var isleadingzero = true
    for item in res {
        if item != 0 {
            isleadingzero = false
        } else if isleadingzero {
            continue
        }
        ans += String(item)
    }
    return ans
}

// same as the multiply2, but more functional style.
func multiply3(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }

    let sumCount = num1.count + num2.count
    var res = Array(repeating: 0, count: sumCount)
    for (index1, char1) in num1.reversed().enumerated() {
        let charNum1 = char1.wholeNumberValue ?? 0
        for (index2, char2) in num2.reversed().enumerated() {
            let charNum2 = char2.wholeNumberValue ?? 0
            res[sumCount - 1 - index1 - index2] += charNum1 * charNum2
        }
    }

    var carry = 0
    res = res.reversed()
        .map { val in
            let sum = val + carry
            carry = sum / 10
            return sum % 10
        }
        .reversed()

    return res[(res.firstIndex(where: { $0 != 0 }) ?? res.endIndex) ..< res.count]
        .reduce("") { result, value -> String in
            result + String(value)
        }
}

// TODO: There are more performance approach for this problem, and that is FFT
