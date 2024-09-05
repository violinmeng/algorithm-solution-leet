public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (idx, num) in nums.enumerated() {
        if let pidx = map[target - num] {
            return [pidx, idx]
        }
        map[num] = idx
    }
    return []
}
