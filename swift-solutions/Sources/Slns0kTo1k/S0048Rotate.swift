// The rotation can divide into two steps.
// first, flip the matrix horizontally
// second, flip it diagonally.
// finally, we got an matrix rotated 90 degrees clockwise.
func rotate(_ matrix: inout [[Int]]) {
    var count = matrix.count

    // flip horizontally
    for row in 0 ..< count / 2 {
        matrix.swapAt(row, count - row - 1)
    }

    // flip diagonally
    for row in 0 ..< count {
        for col in 0 ..< count where row < col {
            let tmp = matrix[row][col]
            matrix[row][col] = matrix[col][row]
            matrix[col][row] = tmp
        }
    }
}

// when we look at the original matrix and the rotated matrix.
// for each element, we call it a[row][col], it will move to the destination of [col][n-1-row]
// and for the elements a[col][n-1-row] will move to a[n-1-row][n-1-col]
// we iterate this process, we will figure out the element will move to the starting point after four times iterations.
// so the process like a -> b -> c -> d -> a
// we can use a variable tmp store the a's value temporarily.
// then move d's value to a, c's to d, b's to c and tmp to b.
// the last thing we need noticing is taking care of the range of iterating.

func rotate1(_ matrix: inout [[Int]]) {
    var count = matrix.count

    for row in 0 ..< count / 2 {
        for col in 0 ..< (count + 1) / 2 {
            let tmp = matrix[row][col]
            matrix[row][col] = matrix[count - col - 1][row]
            matrix[count - col - 1][row] = matrix[count - row - 1][count - col - 1]
            matrix[count - row - 1][count - col - 1] = matrix[col][count - row - 1]
            matrix[col][count - row - 1] = tmp
        }
    }
}
