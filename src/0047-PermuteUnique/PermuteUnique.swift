class Solution {
    var ans:[[Int]] = []

    func DFS(_ remainder: inout [Int], _ com: inout [Int]) {
        if remainder.count == 1 {
            com.append(remainder.first!)
            ans.append(com)
            com.removeLast()
            return
        }
        
        var cremainder = remainder
        for (idx, item) in cremainder.enumerated() {
            if idx == 0 || item != cremainder[idx - 1] {
                com.append(item)
                remainder.remove(at: idx)
                DFS(&remainder, &com)
                com.removeLast()
                remainder = cremainder
            }
        }
        
    }
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var com:[Int] = []
        var nums = nums.sorted()
        DFS(&nums, &com)
        return ans
    }
}

print(Solution().permute([1,1,2]))
print(Solution().permute([1,2,3]))