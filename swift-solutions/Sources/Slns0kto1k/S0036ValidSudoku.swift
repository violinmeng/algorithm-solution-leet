func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var cols = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var boxes = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 3), count: 3)

    for idx in 0 ..< 9 {
        for jdx in 0 ..< 9 {
            let char = board[idx][jdx]
            if char == "." {
                continue
            } else if let casciivalue = char.asciiValue, let zeroAsciiValue = Character("1").asciiValue {
                let num = Int(casciivalue) - Int(zeroAsciiValue)
                if rows[idx][num] || cols[jdx][num] || boxes[idx / 3][jdx / 3][num] {
                    return false
                }
                rows[idx][num] = true
                cols[jdx][num] = true
                boxes[idx / 3][jdx / 3][num] = true
            }
        }
    }
    return true
}
