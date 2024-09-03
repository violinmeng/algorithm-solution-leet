// The Swift Programming Language
// https://docs.swift.org/swift-book

import Slns0kTo1k
import Base

print(LinkList(with: [1,2,3,4,5]))

print(getImportance(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1))
print(getImportanceV2(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1))

let nums = [2,7,11,15]
print(twoSum(nums, 9))


print(LinkList(head:partition(LinkList.from(array: [1,4,3,2,5,2]).head, 3)))
