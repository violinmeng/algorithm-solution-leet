
func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var cols = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
    var boxes = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 3), count: 3)
    
    for i in 0..<9 {
        for j in 0..<9 {
            let c = board[i][j]
            if c == "." {
                continue
            } else if let casciivalue = c.asciiValue, let zeroAsciiValue = Character("1").asciiValue {
                let num = Int(casciivalue) - Int(zeroAsciiValue)
                if rows[i][num] || cols[j][num] || boxes[i/3][j/3][num] {
                    return false
                }
                rows[i][num] = true
                cols[j][num] = true
                boxes[i/3][j/3][num] = true
            }
        }
    }
    return true
}


print(isValidSudoku([
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]]))