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
        State.start : [State.start, State.invalid, State.twoByte, State.threeByte, State.fourByte, State.invalid],
        State.twoByte : [State.invalid, State.start, State.invalid, State.invalid, State.invalid, State.invalid],
        State.threeByte : [State.invalid, State.twoByte, State.invalid, State.invalid, State.invalid, State.invalid],
        State.fourByte : [State.invalid, State.threeByte, State.invalid, State.invalid, State.invalid, State.invalid],
        State.invalid : [State.invalid, State.invalid, State.invalid, State.invalid, State.invalid, State.invalid],
    ]
    
    private func getColumn(_ char: Int) -> Int {
        if char & 0b10000000 == 0b00000000 {
            return 0
        } else if char & 0b11000000 == 0b10000000 {
            return 1
        } else if char & 0b11100000 == 0b11000000 {
            return 2
        } else if char & 0b11110000 == 0b11100000 {
            return 3
        } else if char & 0b11111000 == 0b11110000 {
            return 4
        } else {
            return 5
        }
    }
    
    func getChar(_ c:Int) -> State {
        state = stateMap[state]?[getColumn(c)] ?? State.invalid
        return state
    }
}

func validUTF8(_ data: [Int]) -> Bool {
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

print(validUTF8([237]))
print(validUTF8([197,130,1]))
print(validUTF8([235,140,4]))
