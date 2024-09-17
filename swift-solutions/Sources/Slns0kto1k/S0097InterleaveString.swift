public func isInterleave(_ str1: String, _ str2: String, _ str3: String) -> Bool {
    if str1.isEmpty {
        return str3 == str2
    }
    if str2.isEmpty {
        return str3 == str1
    }
    let ps1 = str1.index(before: str1.endIndex)
    let ps2 = str2.index(before: str2.endIndex)
    let ps3 = str3.index(before: str3.endIndex)
    var res = false
    if str1[ps1] == str3[ps3] {
        res = res || isInterleave(String(str1[..<ps1]), str2, String(str3[..<ps3]))
    }
    if str2[ps2] == str3[ps3] {
        res = res || isInterleave(str1, String(str2[..<ps2]), String(str3[..<ps3]))
    }
    return res
}

public func isInterleaveV2(_ str1: String, _ str2: String, _ str3: String) -> Bool {
    if str1.isEmpty {
        return str3 == str2
    }
    if str2.isEmpty {
        return str3 == str1
    }
    guard str1.count + str2.count == str3.count else {
        return false
    }
    let chars1 = Array(str1)
    let chars2 = Array(str2)
    let chars3 = Array(str3)
    var vec = Array(repeating: Array(repeating: false, count: str2.count + 1), count: str1.count + 1)
    vec[0][0] = true
    for idx in 0...str1.count {
        for jdx in 0...str2.count {
            if idx > 0 {
                vec[idx][jdx] = vec[idx][jdx] || (vec[idx-1][jdx] && chars1[idx-1] == chars3[idx+jdx-1])
            }
            if jdx > 0 {
                vec[idx][jdx] = vec[idx][jdx] || (vec[idx][jdx-1] && chars2[jdx-1] == chars3[idx+jdx-1])
            }
        }
    }
    return vec[str1.count][str2.count]
}

public func isInterleaveV3(_ str1: String, _ str2: String, _ str3: String) -> Bool {
    if str1.isEmpty {
        return str3 == str2
    }
    if str2.isEmpty {
        return str3 == str1
    }
    guard str1.count + str2.count == str3.count else {
        return false
    }
    let chars1 = Array(str1)
    let chars2 = Array(str2)
    let chars3 = Array(str3)
    var vec = Array(repeating: false, count: str2.count + 1)
    vec[0] = true
    for idx in 0...str1.count {
        for jdx in 0...str2.count {
            if idx > 0 {
                vec[jdx] = (vec[jdx] && chars1[idx-1] == chars3[idx+jdx-1])
            }
            if jdx > 0 {
                vec[jdx] = vec[jdx] || (vec[jdx-1] && chars2[jdx-1] == chars3[idx+jdx-1])
            }
        }
    }
    return vec[str2.count]
}
