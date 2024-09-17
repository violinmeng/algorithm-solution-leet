class ValidUTF8Automation {
    enum State {
        case start
        case twoByte
        case threeByte
        case fourByte
        case invalid
    }

    private var state = State.start

    private var stateMap = [
        State.start: [State.start, State.invalid, State.twoByte, State.threeByte, State.fourByte, State.invalid],
        State.twoByte: [State.invalid, State.start, State.invalid, State.invalid, State.invalid, State.invalid],
        State.threeByte: [State.invalid, State.twoByte, State.invalid, State.invalid, State.invalid, State.invalid],
        State.fourByte: [State.invalid, State.threeByte, State.invalid, State.invalid, State.invalid, State.invalid],
        State.invalid: [State.invalid, State.invalid, State.invalid, State.invalid, State.invalid, State.invalid]
    ]

    private func getColumn(_ char: Int) -> Int {
        if char & 0b1000_0000 == 0b0000_0000 {
            0
        } else if char & 0b1100_0000 == 0b1000_0000 {
            1
        } else if char & 0b1110_0000 == 0b1100_0000 {
            2
        } else if char & 0b1111_0000 == 0b1110_0000 {
            3
        } else if char & 0b1111_1000 == 0b1111_0000 {
            4
        } else {
            5
        }
    }

    func getChar(_ char: Int) -> State {
        state = stateMap[state]?[getColumn(char)] ?? State.invalid
        return state
    }
}

func validUTF8DFA(_ data: [Int]) -> Bool {
    var aut = ValidUTF8Automation()
    var state = ValidUTF8Automation.State.invalid
    for char in data {
        state = aut.getChar(char)
        if state == ValidUTF8Automation.State.invalid {
            return false
        }
    }
    return state == ValidUTF8Automation.State.start
}
