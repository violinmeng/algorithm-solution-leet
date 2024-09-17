// the solution for this problem has three steps:
// first, find the adjacent decreasing element of the given array in reverse order.
//         and we got an index, we call it decreasing index
// second, take the element we got in first step to the later part of the array.
//         find a position where its original element is greater than the holding element
//         and the elements after that are all less than the holding elements. Then we
//         we got an inserting index.
// third, exchange the elements of the decreasing and inserting index. we got that
//         the elements after the decreasing index are in descending order. we just sort
//         those in ascending order.

func nextPermutation(_ nums: inout [Int]) {
    if nums.count <= 1 {
        return
    }

    let decreasingSequences = findDecreasingSequences(&nums)
    if decreasingSequences < 0 {
        reverseSorted(&nums, from: 0, to: nums.count - 1)
        return
    } else {
        let anchor = decreasingSequences
        let insertIndex = findInsertIndex(&nums, anchor: anchor)
        nums.swapAt(anchor, insertIndex)
        reverseSorted(&nums, from: anchor + 1, to: nums.count - 1)
    }
}

func findDecreasingSequences(_ nums: inout [Int]) -> Int {
    var cur = nums.count - 1
    var pre = cur - 1

    while pre >= 0, nums[cur] <= nums[pre] {
        cur -= 1
        pre -= 1
    }
    return pre
}

func findInsertIndex(_ nums: inout [Int], anchor: Int) -> Int {
    let target = nums[anchor]

    var cur = nums.count - 1

    while cur >= 0, nums[cur] <= target {
        cur -= 1
    }

    return cur
}

func reverseSorted(_ nums: inout [Int], from: Int, to: Int) {
    var start = from
    var end = to
    while start < end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
    }
}
