public func numDecodings(_ str: String) -> Int {
    var pre2 = 0
    var pre1 = 1
    var cur = 0
    var preDigit = ""
    for char in str {
        cur = 0
        let curDigit = String(char)
        if curDigit != "0" {
            cur += pre1
        }

        if preDigit == "1" || (preDigit == "2" && curDigit <= "6") {
            cur += pre2
        }
        pre2 = pre1
        pre1 = cur
        preDigit = curDigit
    }
    return cur
}
