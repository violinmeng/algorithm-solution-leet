@testable import Base
@testable import Slns0kTo1k
import XCTest

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class SwiftSolutionsTests: XCTestCase {
    func testS0001TwoSum() throws {
        XCTAssertEqual(twoSum([2, 7, 11, 15], 9), [0, 1])
    }

    func testS0002AddTwoNumbers() throws {
        let link1 = LinkList.from(array: [2, 4, 3])
        let link2 = LinkList.from(array: [5, 6, 4])
        let res = LinkList(head: addTwoNumbers(link1.head, link2.head))
        let expect = LinkList.from(array: [7, 0, 8])
        XCTAssertEqual(res, expect)
    }

    func testS0003LongestSubstringWithoutRepeatingCharacters() throws {
        XCTAssertEqual(lengthOfLongestSubstring("abcabcbb"), 3)
        XCTAssertEqual(lengthOfLongestSubstring("bbbbb"), 1)
        XCTAssertEqual(lengthOfLongestSubstring("pwwkew"), 3)
    }

    func testS0008StringToIntegerAtoi() throws {
        XCTAssertEqual(myAtoi("42"), 42)
        XCTAssertEqual(myAtoi("   -42"), -42)
        XCTAssertEqual(myAtoi("4193 with words"), 4193)
        XCTAssertEqual(myAtoi("words and 987"), 0)
        XCTAssertEqual(myAtoi("-91283472332"), -2147483648)
        XCTAssertEqual(myDFAAtoi("42"), 42)
        XCTAssertEqual(myDFAAtoi("   -42"), -42)
        XCTAssertEqual(myDFAAtoi("4193 with words"), 4193)
        XCTAssertEqual(myDFAAtoi("words and 987"), 0)
        XCTAssertEqual(myDFAAtoi("-91283472332"), -2147483648)
    }

    func testS0022GenerateParentheses() throws {
        XCTAssertEqual(generateParenthesis(3), ["((()))", "(()())", "(())()", "()(())", "()()()"])
    }

    func testS0024SwapNodesInPairs() throws {
        let res = LinkList(head: swapPairs(LinkList.from(array: [1, 2, 3, 4]).head))
        let expect = LinkList.from(array: [2, 1, 4, 3])
        XCTAssertEqual(res, expect)
        let res2 = LinkList(head: swapPairsRecursive(LinkList.from(array: [1, 2, 3, 4]).head))
        XCTAssertEqual(res2, expect)
    }

    func testS0029DivideTwoIntegers() throws {
        XCTAssertEqual(divide(10, 3), 3)
        XCTAssertEqual(divide(7, -3), -2)
        XCTAssertEqual(divide(0, 1), 0)
        XCTAssertEqual(divide(1, 1), 1)
    }

    func testS0031NextPermutation() throws {
        var nums = [1, 2, 3]
        nextPermutation(&nums)
        XCTAssertEqual(nums, [1, 3, 2])
        var nums2 = [3, 2, 1]
        nextPermutation(&nums2)
        XCTAssertEqual(nums2, [1, 2, 3])
        var nums3 = [1, 1, 5]
        nextPermutation(&nums3)
        XCTAssertEqual(nums3, [1, 5, 1])
    }

    func testS0033SearchInRotatedSortedArray() throws {
        XCTAssertEqual(searchEnumeratedVersion([4, 5, 6, 7, 0, 1, 2], 0), 4)
        XCTAssertEqual(searchMergeCasesVersion([4, 5, 6, 7, 0, 1, 2], 0), 4)
        XCTAssertEqual(searchEnumeratedVersion([4, 5, 6, 7, 0, 1, 2], 3), -1)
        XCTAssertEqual(searchMergeCasesVersion([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }

    func testS0036ValidSudoku() throws {
        XCTAssertEqual(isValidSudoku([
            ["5", "3", ".", ".", "7", ".", ".", ".", "."],
            ["6", ".", ".", "1", "9", "5", ".", ".", "."],
            [".", "9", "8", ".", ".", ".", ".", "6", "."],
            ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
            ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
            ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
            [".", "6", ".", ".", ".", ".", "2", "8", "."],
            [".", ".", ".", "4", "1", "9", ".", ".", "5"],
            [".", ".", ".", ".", "8", ".", ".", "7", "9"]
        ]), true)
    }

    func testS0038CountAndSay() throws {
        XCTAssertEqual(countAndSay(1), "1")
        XCTAssertEqual(countAndSay(2), "11")
        XCTAssertEqual(countAndSay(3), "21")
        XCTAssertEqual(countAndSay(4), "1211")
    }

    func testS0043MultiplyStrings() throws {
        XCTAssertEqual(multiply("2", "3"), "6")
        XCTAssertEqual(multiply("123", "456"), "56088")
    }

    func testS0046Permutations() throws {
        var res = PermuteSolution().permute([1, 2, 3])
        XCTAssertEqual(Set(res), Set([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]))
    }

    func testS0048RotateImage() throws {
        var matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        rotate(&matrix)
        XCTAssertEqual(matrix, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    }

    func testS0049GroupAnagrams() throws {
        let result = groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
        let expected = [["bat"], ["nat", "tan"], ["ate", "eat", "tea"]]
        XCTAssertEqual(Set(result.map { Set($0) }), Set(expected.map { Set($0) }))
    }

    func testS0050Pow() throws {
        XCTAssertEqual(myPow(2.00000, 10), 1024.00000, accuracy: 0.00001)
        XCTAssertEqual(myPow(2.10000, 3), 9.26100, accuracy: 0.00001)
    }

    func testS0055JumpGame() throws {
        XCTAssertEqual(canJump([2, 3, 1, 1, 4]), true)
        XCTAssertEqual(canJump([3, 2, 1, 0, 4]), false)
        XCTAssertEqual(canJumpRecursive([2, 3, 1, 1, 4]), true)
        XCTAssertEqual(canJumpRecursive([3, 2, 1, 0, 4]), false)
    }

    func testS0056MergeIntervals() throws {
        XCTAssertEqual(merge([[1, 3], [2, 6], [8, 10], [15, 18]]), [[1, 6], [8, 10], [15, 18]])
        XCTAssertEqual(merge([[2, 3], [4, 5], [1, 4], [15, 18]]), [[1, 5], [15, 18]])
    }

    func testS0057InsertInterval() throws {
        XCTAssertEqual(insert([[1, 3], [6, 9]], [2, 5]), [[1, 5], [6, 9]])
        XCTAssertEqual(insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]), [[1, 2], [3, 10], [12, 16]])
    }

    func testS0061RotateList() throws {
        let res = LinkList(head: rotateRight(LinkList.from(array: [1, 2, 3, 4, 5]).head, 2))
        let expect = LinkList.from(array: [4, 5, 1, 2, 3])
        XCTAssertEqual(res, expect)
    }

    func testS0062UniquePaths() throws {
        XCTAssertEqual(uniquePaths(3, 7), 28)
        XCTAssertEqual(uniquePaths(3, 2), 3)
    }

    func testS0070ClimbingStairs() throws {
        XCTAssertEqual(climbStairs(2), 2)
        XCTAssertEqual(climbStairs(3), 3)
    }

    func testS0080RemoveDuplicatesFromSortedArrayII() throws {
        var nums = [1, 1, 1, 2, 2, 3]
        XCTAssertEqual(removeDuplicates(&nums), 5)
        var nums1 = [0, 0, 0, 0, 0]
        XCTAssertEqual(removeDuplicates(&nums1), 2)
        var nums2 = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10]
        XCTAssertEqual(removeDuplicates(&nums2), 20)
    }

    func testS0081SearchInRotatedSortedArrayII() throws {
        XCTAssertEqual(rotateNumsSearchII([2, 5, 6, 0, 0, 1, 2], 0), true)
        XCTAssertEqual(rotateNumsSearchII([2, 5, 6, 0, 0, 1, 2], 3), false)
        XCTAssertEqual(rotateNumsSearchII([3], 3), true)
        XCTAssertEqual(rotateNumsSearchII([3, 1, 2, 3, 3, 3, 3], 2), true)
    }

    func testS0086PartitionList() throws {
        let res = LinkList(head: partition(LinkList.from(array: [1, 4, 3, 2, 5, 2]).head, 3))
        let expect = LinkList.from(array: [1, 2, 2, 4, 3, 5])
        XCTAssertEqual(res, expect)
    }

    func testS0088MergeSortedArray() throws {
        var nums1 = [1, 2, 3, 0, 0, 0]
        merge(&nums1, 3, [2, 5, 6], 3)
        XCTAssertEqual(nums1, [1, 2, 2, 3, 5, 6])
    }

    func testS0089GrayCode() throws {
        XCTAssertEqual(grayCode(2), [0, 1, 3, 2])
        XCTAssertEqual(grayCodeV2(2), [0, 1, 3, 2])
    }

    func testS0091NumDecodings() throws {
        XCTAssertEqual(numDecodings("12"), 2)
        XCTAssertEqual(numDecodings("226"), 3)
        XCTAssertEqual(numDecodings("06"), 0)
        XCTAssertEqual(numDecodings("10"), 1)
        XCTAssertEqual(numDecodings("27"), 1)
    }

    func testS0092ReverseLinkedListII() throws {
        let res = LinkList(head: reverseBetween(LinkList.from(array: [1, 2, 3, 4, 5]).head, 2, 4))
        let expect = LinkList.from(array: [1, 4, 3, 2, 5])
        XCTAssertEqual(res, expect)
    }

    func testS0097InterleaveString() throws {
        XCTAssertEqual(isInterleave("aabcc", "dbbca", "aadbbcbcac"), true)
        XCTAssertEqual(isInterleave("aabcc", "dbbca", "aadbbbaccc"), false)
        XCTAssertEqual(isInterleave("", "", ""), true)
        XCTAssertEqual(isInterleaveV2("aabcc", "dbbca", "aadbbcbcac"), true)
        XCTAssertEqual(isInterleaveV2("aabcc", "dbbca", "aadbbbaccc"), false)
        XCTAssertEqual(isInterleaveV2("", "", ""), true)
        XCTAssertEqual(isInterleaveV3("aabcc", "dbbca", "aadbbcbcac"), true)
        XCTAssertEqual(isInterleaveV3("aabcc", "dbbca", "aadbbbaccc"), false)
        XCTAssertEqual(isInterleaveV3("", "", ""), true)
    }

    func testS0137SingleNumber() throws {
        XCTAssertEqual(singleNumber([2, 2, 3, 2]), 3)
        XCTAssertEqual(singleNumber([0, 1, 0, 1, 0, 1, 99]), 99)
    }

    func testS0146LRUCache() throws {
        let lru = LRUCache(2)
        lru.put(1, 1)
        lru.put(2, 2)
        XCTAssertEqual(lru.get(1), 1)
        lru.put(3, 3)
        XCTAssertEqual(lru.get(2), -1)
        lru.put(4, 4)
        XCTAssertEqual(lru.get(1), -1)
    }

    func testS0147InsertionSortList() throws {
        let res = LinkList(head: insertionSortList(LinkList.from(array: [4, 2, 1, 3]).head))
        let expect = LinkList.from(array: [1, 2, 3, 4])
        XCTAssertEqual(res, expect)
    }

    func testS0150EvaluateReversePolishNotation() throws {
        XCTAssertEqual(evalRPN(["2", "1", "+", "3", "*"]), 9)
        XCTAssertEqual(evalRPN(["4", "13", "5", "/", "+"]), 6)
    }

    func testS0151ReverseWordsInAString() throws {
        XCTAssertEqual(reverseWords("the sky is blue"), "blue is sky the")
        XCTAssertEqual(reverseWords("  hello world  "), "world hello")
        XCTAssertEqual(reverseWords("a"), "a")
    }

    func testS0279PerfectSquares() throws {
        XCTAssertEqual(numSquares(12), 3)
        XCTAssertEqual(numSquares(13), 2)
    }

    func testS0374GuessNumberHigherOrLower() throws {
        let game = GuessGame(pick: 6)
        XCTAssertEqual(game.guessNumber(10), 6)
    }

    func testS0393UTF8Validation() throws {
        XCTAssertEqual(validUTF8([197, 130, 1]), true)
        XCTAssertEqual(validUTF8([235, 140, 4]), false)
        XCTAssertEqual(validUTF8DFA([197, 130, 1]), true)
        XCTAssertEqual(validUTF8DFA([235, 140, 4]), false)
    }

    func testS0415AddStrings() throws {
        XCTAssertEqual(addStrings("123", "456"), "579")
        XCTAssertEqual(addStrings("999", "1"), "1000")
    }

    func testS0690EmployeeImportance() throws {
        XCTAssertEqual(getImportance(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1), 11)
        XCTAssertEqual(getImportanceV2(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1), 11)
    }
}
