
func ~=<T>(lhs: KeyPath<T, Bool>, rhs: T) -> Bool {
    rhs[keyPath: lhs]
}

class Automation {
    private enum State {
        case start
        case signed
        case number
        case end
    }
    
    private var state = State.start
    
    private var stateMap = [
        State.start : [State.start, State.signed, State.number, State.end],
        State.signed : [State.end, State.end, State.number, State.end],
        State.number : [State.end, State.end, State.number, State.end],
        State.end : [State.end, State.end, State.end, State.end],
    ]
    
    private func getColumn(_ char: Character) -> Int {
        switch char {
        case \.isWhitespace:
            return 0
        case "-","+":
            return 1
        case \.isNumber:
            return 2
        default:
            return 3
        }
    }
    
    private var sign = true
    private var ans:Int = 0
    
    func getChar(_ c:Character) {
        state = stateMap[state]?[getColumn(c)] ?? State.end
        if state == State.number {
            ans = 10 * ans + Int(String(c))!
            ans = sign ? min(ans, Int(Int32.max)) : max(ans, Int(Int32.min))
        } else if state == State.signed {
            sign = c == "+"
        }
    }
    
    var res:Int {
        get {
            return sign ? ans : -ans
        }
    }
}

func myAtoi(_ s:String) -> Int {
    var aut = Automation()
    for char in s {
        aut.getChar(char)
        
    }
    return aut.res;
}

print(myAtoi("42"))
print(myAtoi("-042"))
print(myAtoi("1337c0d3"))
print(myAtoi("0-1"))
print(myAtoi("word and 987"))
print(myAtoi("12773737373737373737373737373737373737373737373737"))