public func lengthOfLongestSubstring(_ str: String) -> Int {
    var record = [Character: Int]()
    var maxLength = 0
    var startIndex = 0
    for (index, char) in str.enumerated() {
        if let lastIndex = record[char] {
            startIndex = max(startIndex, lastIndex + 1)
        }
        maxLength = max(maxLength, index - startIndex + 1)
        record[char] = index
    }
    return maxLength
}
