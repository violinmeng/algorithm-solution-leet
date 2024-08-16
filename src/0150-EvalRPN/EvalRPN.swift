func evalRPN(_ tokens: [String]) -> Int {
    var stack:[Int]  = []
    for token in tokens {
        if let opfunc = opFunc(token) {
            if let a = stack.popLast(), let b = stack.popLast() {
                stack.append(opfunc(b, a)) // when b / a, the position matters
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
            return (+)
        case "-":
            return (-)
        case "*":
            return (*)
        case "/":
            return (/)
        default:
            return nil
    }
}

print(evalRPN(["2","1","+","3","*"]))
