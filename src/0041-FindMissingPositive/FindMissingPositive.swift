// the key to solve this problem is treat the original array as a map
// more details can visit the following link.
// https://leetcode.cn/problems/first-missing-positive/solutions/304743/que-shi-de-di-yi-ge-zheng-shu-by-leetcode-solution
func firstMissingPositive(_ nums: [Int]) -> Int {
    var localnums = nums
    var n = localnums.count
    
    // we only care about the numbers in the range of 1...n
    // If we treat the input array as a map, the index as the key,
    // how to express the value? we use the negative sign as the true of the value.
    // so first we convert each element of the input array to a positive number which we would ignore it, such as n+1.
    for (index, num) in localnums.enumerated() {
        if num <= 0 {
            localnums[index] = n + 1
        }
    }
    
    // if the number within the range of 1 to n presents, we set the element to a negative number.
    for i in 0..<n {
        let num = abs(localnums[i])
        if num <= n {
            localnums[num-1] = -abs(localnums[num-1])
        }
    }
    
    // find the first positive number, and the index plus one is the missing positive number.
    for i in 0..<n {
        if localnums[i] > 0 {
            return i + 1
        }
    }
    return n + 1

}

func firstMissingPositive2(_ nums: [Int]) -> Int {
    // we can also exchange the element in place.
    var n = nums.count
    var localnums = nums
    
    for i in 0..<n {
        while localnums[i] > 0 && localnums[i] <= n && localnums[localnums[i]-1] != localnums[i] {
            localnums.swapAt(i, localnums[i]-1)
        }
    }
    
    for i in 0..<n {
        if localnums[i] != i + 1 {
            return i + 1
        }
    }
    return n + 1
    
}

// this is my solution, but when the nums has duplicated numbers, this solution can not get right answer.
func firstMissingPositive_notperfect(_ nums: [Int]) -> Int {
    var count = 0
    for i in nums {
        if i > 0 {
            count += 1
        }   
    }

    var ans = 1
    var step = 1
    for i in nums {
        if i <= count + 1 && i > 0 {
            ans ^= i
            step += 1
            ans ^= step
        }
    }

    return ans

}

print(firstMissingPositive([1,2,0]))
print(firstMissingPositive([3,4,-1,1]))
print(firstMissingPositive([7,8,9,11,12]))

print(firstMissingPositive2([1,2,0]))
print(firstMissingPositive2([3,4,-1,1]))
print(firstMissingPositive2([7,8,9,11,12]))