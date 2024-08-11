// based on 0039's solution. then sort the candidates and remove the duplicated path
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var arr:[Int] = []
        combinationSumHelper(candidates.sorted(), target, &arr)
        return ans
    }

    var ans:[[Int]] = []

    func combinationSumHelper(_ candidates: [Int], _ target: Int, _  arr:inout [Int])  {
        var pre = 0
        for (index, item) in candidates.enumerated() {
            if item == pre {
                continue
            }
            
            if item == target  {
                arr.append(item)
                ans.append(arr)
                arr.removeLast()
            } else if item < target {
                arr.append(item)
                combinationSumHelper(Array(candidates[(index+1)...]), target - item, &arr)
                arr.removeLast()
            }
            pre = item
        }
    }
}

print(Solution().combinationSum([10,1,2,7,6,1,5], 8))
print(Solution().combinationSum([2,5,2,1,2], 5))