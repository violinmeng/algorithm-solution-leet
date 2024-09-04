public func rotateNumsSearchII(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0
    var right = nums.count - 1
    var mid = (left + right) / 2

    while (left < right) {
        if nums[left] == target || nums[mid] == target || nums[right] == target {
            return true
        }

        if nums[left] == nums[mid] && nums[right] == nums[mid] {
            left += 1
            right -= 1
        } else if nums[left] <= nums[mid] {
            if (target < nums[left] || target > nums[mid]) {
                left = mid + 1
            } else {
                left += 1
                right = mid - 1
            }
        } else {
            if (target < nums[left] && target > nums[mid]) {
                left = mid + 1
            } else {
                left += 1
                right = mid - 1
            }
        }
        mid = (left + right) / 2
    }
    return nums[left] == target
}
