
func removeDuplicates(_ nums: inout [Int]) -> Int {
    let count = nums.count
    if count < 2 {
        return count
    }

    var p1 = 0
    var p2 = 1
    
    while (p2 < count) {
        if nums[p2] != nums[p1] {
            p1 += 1
            nums[p1] = nums[p2]
        }
        p2 += 1
    }
    return p1+1
}

var nums = [0,0,1,1,1,2,2,3,3,4]
let res = removeDuplicates(&nums)
for idx in 0..<res {
    print(nums[idx])
}