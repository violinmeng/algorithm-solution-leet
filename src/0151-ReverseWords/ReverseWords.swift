// using the API provided by stdlib is clear and simple.
func reverseWords1(_ s: String) -> String {
    var arr = s.split(separator: " ")
    arr.reverse()
    return arr.joined(separator: " ")
}

// Here we try to solve this problem by operating characters of the string.
// And this make more sense for this question designer's purpose.
// Because we can not modify the string directly in swift, 
// So we convert it to array and adjust the position of the characters.
// Firstly, reverse the whole array.
// Secondly, we keeping two pointers, one points to the starting index which the word will finally locate,
// another points to the ending index which the word currently locate.
// And we reverse the characters between those two pointers.
// Then update those pointers, and finally we got the desired array,
// and all of the extra spaces will move to the end of the array.
// we just need select the proper range of the array, and transform it to final string.
func reverseWords(_ s: String) -> String {
    
    var chars = Array(s)
    
    reverseCharsInPlace(&chars, 0, chars.count - 1)
    chars.append(" ")
    
    var p1 = 0
    var p2 = 0
    var wordLength = 0
    while p2 < chars.count {
        if chars[p2] != " " {
            wordLength += 1
        }
        if chars[p2] != " " && chars[p2 + 1] == " " {
            reverseCharsInPlace(&chars, p1, p2)
            p1 += (wordLength + 1)
            wordLength = 0
        }
        p2 += 1
    }
        
    if p1 > 1 {
        return String(chars[0...p1-2])
    }
    return ""
}

func reverseCharsInPlace(_ s: inout [Character], _ start: Int, _ end: Int) {
    if start >= end || end >= s.count {
        return
    }
    var left = start
    var right = end
    while left < right {
        s.swapAt(left, right)
        left += 1
        right -= 1
    }
}

print(reverseWords(" "))
print(reverseWords(" a good   example "))
print(reverseWords("F R  I   E    N     D      S      "))