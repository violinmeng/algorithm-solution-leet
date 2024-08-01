
func lengthOfLongestSubstring(_ s:String) -> Int {
    var record = Dictionary<Character, Int>()
    var maxLength = 0
    var startIndex = 0
    for (index, char) in s.enumerated() {
        if let lastIndex = record[char] {
            startIndex = max(startIndex, lastIndex + 1)
        }
        maxLength = max(maxLength, index - startIndex + 1)
        record[char] = index
    }
    return maxLength
}

print(lengthOfLongestSubstring("asddsssfswd"))