class PermuteSolution {
    var ans: [[Int]] = []

    func DFS(_ remainder: inout [Int], _ com: inout [Int]) {
        if remainder.count == 1 {
            com.append(remainder.first!)
            ans.append(com)
            com.removeLast()
            return
        }

        var cremainder = remainder
        for (idx, item) in cremainder.enumerated() {
            com.append(item)
            remainder.remove(at: idx)
            DFS(&remainder, &com)
            com.removeLast()
            remainder = cremainder
        }
    }

    func permute(_ nums: [Int]) -> [[Int]] {
        var com: [Int] = []
        var nums = nums
        DFS(&nums, &com)
        return ans
    }
}
