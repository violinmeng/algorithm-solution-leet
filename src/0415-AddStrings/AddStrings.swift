func addStrings(_ num1: String, _ num2: String) -> String {

    var carry = 0

    var p1 = num1.endIndex
    var p2 = num2.endIndex

    var ans=""
    
    repeat {
        var cur1 = 0
        if p1 != num1.startIndex {
            p1 = num1.index(before: p1)
            cur1 = num1[p1].wholeNumberValue ?? 0
        }
        
        var cur2 = 0
        if p2 != num2.startIndex {
            p2 = num2.index(before: p2)
            cur2 = num2[p2].wholeNumberValue ?? 0
        }
        
        var sum = cur1 + cur2 + carry
        carry = sum / 10
        ans += "\(sum % 10)"
        
    } while p1 != num1.startIndex || p2 != num2.startIndex

    if carry > 0 {
        ans += "\(carry)"
    }
    
    return String(ans.reversed())
}
print(addStrings("11","134"))
print(addStrings("1","999"))