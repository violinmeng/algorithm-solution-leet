// but this solution would cost too much time.
func canJumpRecursive(_ nums: [Int]) -> Bool {
    if (nums.count == 1) {
        return true
    }
    var ans = false
    for i in 0..<nums.count-1 {
        if nums[i] >= nums.count-1-i {
            ans =  ans || canJump(Array(nums[0...i]))
        }
    }
    return ans
}

func canJump(_ nums: [Int]) -> Bool {
    // greedy solution
    // maintain a reach most index,
    // if the index is greater or equal than the end index, this means we can jump to the end.
    // otherwise, if we reach an index is greater than the reach most index,
    // that means we stuck in this index and can not move forward any longer.
    // finally, we can only update the reach most index within the reachable index.
    var reach = 0

    for i in 0..<nums.count {
        if reach >= i {
            reach = max(reach, i+nums[i])
            if reach >= nums.count-1 {
                return true
            }
        } else {
            return false
        }
    }
    return false
}

print(canJump([2,3,1,1,4]))
print(canJump([3.2,1,0,4]))
print(canJump([2]))
print(canJump([0]))
