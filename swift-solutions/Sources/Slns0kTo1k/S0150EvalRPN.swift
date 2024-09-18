func evalRPN(_ tokens: [String]) -> Int {
    var stack: [Int] = []
    for token in tokens {
        if let opfunc = opFunc(token) {
            if let oprand1 = stack.popLast(), let oprand2 = stack.popLast() {
                stack.append(opfunc(oprand2, oprand1)) // when b / a, the position matters
            }
        } else {
            stack.append(Int(token) ?? 0)
        }
    }
    return stack.last ?? 0
}

func opFunc(_ token: String) -> ((Int, Int) -> Int)? {
    switch token {
    case "+":
        (+)
    case "-":
        (-)
    case "*":
        (*)
    case "/":
        (/)
    default:
        nil
    }
}
