// using the API provided by stdlib is clear and simple.
func reverseWords1(_ str: String) -> String {
    var arr = str.split(separator: " ")
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
func reverseWords(_ str: String) -> String {
    var chars = Array(str)

    reverseCharsInPlace(&chars, 0, chars.count - 1)
    chars.append(" ")

    var ptr1 = 0
    var ptr2 = 0
    var wordLength = 0
    while ptr2 < chars.count {
        if chars[ptr2] != " " {
            wordLength += 1
        }
        if chars[ptr2] != " ", chars[ptr2 + 1] == " " {
            reverseCharsInPlace(&chars, ptr1, ptr2)
            ptr1 += (wordLength + 1)
            wordLength = 0
        }
        ptr2 += 1
    }

    if ptr1 > 1 {
        return String(chars[0 ... ptr1 - 2])
    }
    return ""
}

func reverseCharsInPlace(_ str: inout [Character], _ start: Int, _ end: Int) {
    if start >= end || end >= str.count {
        return
    }
    var left = start
    var right = end
    while left < right {
        str.swapAt(left, right)
        left += 1
        right -= 1
    }
}
