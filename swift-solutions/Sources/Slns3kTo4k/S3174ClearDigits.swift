
public func clearDigits(_ s: String) -> String {
    var stack: [Character] = []
    for c in s {
        if c.isWholeNumber {
            _ = stack.popLast()
        } else {
            stack.append(c)
        }
    }
    return String(stack)
}
