
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

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))