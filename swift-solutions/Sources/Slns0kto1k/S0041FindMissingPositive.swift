// the key to solve this problem is treat the original array as a map
// more details can visit the following link.
// swiftlint:disable:next line_length
// https://leetcode.cn/problems/first-missing-positive/solutions/304743/que-shi-de-di-yi-ge-zheng-shu-by-leetcode-solution
func firstMissingPositive(_ nums: [Int]) -> Int {
    var localnums = nums
    var count = localnums.count

    // we only care about the numbers in the range of 1...n
    // If we treat the input array as a map, the index as the key,
    // how to express the value? we use the negative sign as the true of the value.
    // so first we convert each element of the input array to a positive number which we would ignore it, such as n+1.
    for (index, num) in localnums.enumerated() where num <= 0 {
        localnums[index] = count + 1
    }

    // if the number within the range of 1 to n presents, we set the element to a negative number.
    for idx in 0 ..< count {
        let num = abs(localnums[idx])
        if num <= count {
            localnums[num - 1] = -abs(localnums[num - 1])
        }
    }

    // find the first positive number, and the index plus one is the missing positive number.
    for idx in 0 ..< count where localnums[idx] > 0 {
        return idx + 1
    }
    return count + 1
}

func firstMissingPositive2(_ nums: [Int]) -> Int {
    // we can also exchange the element in place.
    var count = nums.count
    var localnums = nums

    for idx in 0 ..< count {
        while localnums[idx] > 0, localnums[idx] <= count, localnums[localnums[idx] - 1] != localnums[idx] {
            localnums.swapAt(idx, localnums[idx] - 1)
        }
    }

    for idx in 0 ..< count where localnums[idx] != idx + 1 {
        return idx + 1
    }
    return count + 1
}

// this is my solution, but when the nums has duplicated numbers, this solution can not get right answer.
func firstMissingPositive_notperfect(_ nums: [Int]) -> Int {
    var count = 0
    for idx in nums where idx > 0 {
        count += 1
    }

    var ans = 1
    var step = 1
    for idx in nums {
        if idx <= count + 1, idx > 0 {
            ans ^= idx
            step += 1
            ans ^= step
        }
    }

    return ans
}
