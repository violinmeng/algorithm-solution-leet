// DFS(Depth fist search)
class Solution {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var arr:[Int] = []
        combinationSumHelper(candidates, target, &arr)
        return ans
    }

    var ans:[[Int]] = []

    func combinationSumHelper(_ candidates: [Int], _ target: Int, _  arr:inout [Int])  {
        for (index, item) in candidates.enumerated() {
            if item == target {
                arr.append(item)
                ans.append(arr)
                arr.removeLast()
            } else if item < target {
                arr.append(item)
                combinationSumHelper(Array(candidates[index...]), target - item, &arr)
                arr.removeLast()
            }
        }
    }
}

print(Solution().combinationSum([2,3,6,7], 7))
print(Solution().combinationSum([2,3,5], 8))
print(Solution().combinationSum([2], 1))
print(Solution().combinationSum([8,7,4,3], 11))