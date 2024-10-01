// The Swift Programming Language
// https://docs.swift.org/swift-book

import Base
import Slns0kTo1k
import Slns2kTo3k
import Slns3kTo4k

print(LinkList(with: [1, 2, 3, 4, 5]))

print(getImportance(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1))
print(getImportanceV2(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1))

let nums = [2, 7, 11, 15]
print(twoSum(nums, 9))

print(LinkList(head: partition(LinkList.from(array: [1, 4, 3, 2, 5, 2]).head, 3)))

print(grayCode(0))
print(grayCode(1))
print(grayCode(2))
print(grayCode(3))
print(grayCode(4))

print(searchEnumeratedVersion([4, 5, 6, 7, 0, 1, 2], 3))
print(searchMergeCasesVersion([4, 5, 6, 7, 0, 1, 2], 3))

print(clearDigits("cb34"))
print(clearDigits("abc"))

print(LinkList(head: reverseBetween(LinkList.from(array: [1, 2, 3, 4, 5]).head, 2, 4)))

print(isInterleaveV3("aabcc", "dbbca", "aadbbcbcac"))
print(isInterleaveV3("aabcc", "dbbca", "aadbbbaccc"))
print(isInterleaveV3("", "", ""))

print(Int(Int32.min))

print(longestContinuousSubstring("abacde"))

print(LinkList(head: mergeNodes(LinkList.from(array: [0, 3, 1, 0, 4, 5, 2, 0]).head)))

print(reverseInt(123))
print(reverseInt(-123))
print(reverseInt(120))
print(reverseInt(Int.max))
print(reverseInt(Int.min))
print(reverseInt(8223372036854775839))
print(reverseInt(-8223372036854775839))
