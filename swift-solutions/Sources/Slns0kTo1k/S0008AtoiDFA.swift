func ~= <T>(lhs: KeyPath<T, Bool>, rhs: T) -> Bool {
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
        State.start: [State.start, State.signed, State.number, State.end],
        State.signed: [State.end, State.end, State.number, State.end],
        State.number: [State.end, State.end, State.number, State.end],
        State.end: [State.end, State.end, State.end, State.end]
    ]

    private func getColumn(_ char: Character) -> Int {
        switch char {
        case \.isWhitespace:
            0
        case "-", "+":
            1
        case \.isNumber:
            2
        default:
            3
        }
    }

    private var sign = true
    private var ans: Int = 0

    func getChar(_ char: Character) {
        state = stateMap[state]?[getColumn(char)] ?? State.end
        if state == State.number {
            ans = 10 * ans + Int(String(char))!
            ans = sign ? min(ans, Int(Int32.max)) : min(ans, -Int(Int32.min))
        } else if state == State.signed {
            sign = char == "+"
        }
    }

    var res: Int {
        sign ? ans : -ans
    }
}

public func myDFAAtoi(_ str: String) -> Int {
    var aut = Automation()
    for char in str {
        aut.getChar(char)
    }
    return aut.res
}
