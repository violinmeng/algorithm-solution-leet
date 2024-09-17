func myAtoi(_ str: String) -> Int {
    var getValidChar = false
    var res = 0
    var isNegative = false
    var toRet = false
    for char in str {
        switch char {
        case " ":
            if getValidChar {
                toRet = true
            }
        case "-", "+":
            if getValidChar {
                toRet = true

            } else {
                isNegative = (char == "-")
                getValidChar = true
            }
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            getValidChar = true
            res = 10 * res + Int(String(char))!
            res = isNegative ? min(res, -Int(Int32.min)) : min(res, Int(Int32.max))
        default:
            toRet = true
        }

        if toRet {
            break
        }
    }
    return isNegative ? -res : res
}
