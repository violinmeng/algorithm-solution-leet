// but this solution would cost too much time.
func canJumpRecursive(_ nums: [Int]) -> Bool {
    if nums.count == 1 {
        return true
    }
    var ans = false
    for idx in 0 ..< nums.count - 1 where nums[idx] >= nums.count - 1 - idx {
        ans = ans || canJump(Array(nums[0 ... idx]))
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

    for idx in 0 ..< nums.count {
        if reach >= idx {
            reach = max(reach, idx + nums[idx])
            if reach >= nums.count - 1 {
                return true
            }
        } else {
            return false
        }
    }
    return false
}
