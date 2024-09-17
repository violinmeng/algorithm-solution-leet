func addStrings(_ num1: String, _ num2: String) -> String {
    var carry = 0

    var ptr1 = num1.endIndex
    var ptr2 = num2.endIndex

    var ans = ""

    repeat {
        var cur1 = 0
        if ptr1 != num1.startIndex {
            ptr1 = num1.index(before: ptr1)
            cur1 = num1[ptr1].wholeNumberValue ?? 0
        }

        var cur2 = 0
        if ptr2 != num2.startIndex {
            ptr2 = num2.index(before: ptr2)
            cur2 = num2[ptr2].wholeNumberValue ?? 0
        }

        let sum = cur1 + cur2 + carry
        carry = sum / 10
        ans += "\(sum % 10)"

    } while ptr1 != num1.startIndex || ptr2 != num2.startIndex

    if carry > 0 {
        ans += "\(carry)"
    }

    return String(ans.reversed())
}
