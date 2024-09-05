public func clearDigits(_ str: String) -> String {
    var stack: [Character] = []
    for char in str {
        if char.isWholeNumber {
            _ = stack.popLast()
        } else {
            stack.append(char)
        }
    }
    return String(stack)
}
