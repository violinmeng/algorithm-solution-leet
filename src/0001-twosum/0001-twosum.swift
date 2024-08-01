func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (i, e) in nums.enumerated() {
        if let v = map[target - e] {
            return [v, i]
        }
        map[e] = i
    }
    return []
}

let nums = [2,7,11,15]
print(twoSum(nums, 9))