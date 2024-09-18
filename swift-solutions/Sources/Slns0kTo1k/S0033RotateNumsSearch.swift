// according to the requirement of time complexity
// we know that should use binary search.
// so we define the left and right pointers and narrow that range.
// to cover each of case, we enumerate every case, then we can merge
// those cases, and get the more concise version of the solution.
public func searchEnumeratedVersion(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    var mid = (left + right) / 2

    while left < right {
        if nums[left] < nums[mid] {
            if target > nums[left] {
                if target < nums[mid] {
                    left += 1
                    right = mid - 1
                } else if target == nums[mid] {
                    return mid
                } else {
                    left = mid + 1
                }
            } else if target == nums[left] {
                return left
            } else {
                left = mid + 1
            }

        } else {
            if target > nums[left] {
                left += 1
                right = mid - 1
            } else if target == nums[left] {
                return left
            } else {
                if target < nums[mid] {
                    left += 1
                    right = mid - 1
                } else if target == nums[mid] {
                    return mid
                } else {
                    left = mid + 1
                }
            }
        }
        mid = (left + right) / 2
    }
    return nums[left] == target ? left : -1
}

public func searchMergeCasesVersion(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    var mid = (left + right) / 2

    while left < right {
        if nums[left] == target {
            return left
        }
        if nums[mid] == target {
            return mid
        }

        if nums[left] < nums[mid] {
            if target < nums[left] || target > nums[mid] {
                left = mid + 1
            } else {
                left += 1
                right = mid - 1
            }
        } else {
            if target < nums[left], target > nums[mid] {
                left = mid + 1
            } else {
                left += 1
                right = mid - 1
            }
        }
        mid = (left + right) / 2
    }
    return nums[left] == target ? left : -1
}
