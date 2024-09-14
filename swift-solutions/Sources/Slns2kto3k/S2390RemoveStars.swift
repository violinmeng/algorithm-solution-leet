public func removeStars(_ str: String) -> String {
    var stack: [Character] = []
    for char in str {
        if char == "*" {
            _ = stack.popLast()
        } else {
            stack.append(char)
        }
    }
    return String(stack)
}
