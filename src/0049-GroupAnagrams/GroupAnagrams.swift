// The key to solve this problem is determining how to identify whether two strings are anagrams
// The intuitive way is convert the strings to an unified form, and if the two strings have the same form, they are anagrams
// so we can transform them by sorting each of the strings in alphabet order.
// when we consider the sort algorithm, the counting algorithm will be more efficiency in this case.
// so record the count of each character in every string,
// and compare the count of each alphabet.
// this can be another way of solve this problem.

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var map: [String:[String]] = [:]
    for str in strs {
        let key = String(str.sorted())
        var val = map[key] ?? []
        val.append(str)
        map[key] = val
    }
    
    return Array(map.values)
}

func groupAnagrams2(_ strs: [String]) -> [[String]] {
    if strs.count <= 1 {
        return [strs]
    }
    var map: [String: [String]] = [:]
    for str in strs {
        var countArr = Array(repeating: 0, count: 26)
        for c in str {
            let index = c.asciiValue! - Character("a").asciiValue!
            countArr[Int(index)] += 1
        }

        var key = ""
        for i in 0..<26 {
            if countArr[i] > 0 {
                let c = Character(UnicodeScalar(UInt8(i) + Character("a").asciiValue!))
                key += String(c) + String(countArr[i])
            }
        }
        
        var val = map[key] ?? []
        val.append(str)
        map[key] = val
    }
    return Array(map.values)
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
print(groupAnagrams2(["eat","tea","tan","ate","nat","bat"]))