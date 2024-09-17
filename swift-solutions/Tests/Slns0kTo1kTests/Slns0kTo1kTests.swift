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

    func testS0033SearchInRotatedSortedArray() throws {
        XCTAssertEqual(searchEnumeratedVersion([4, 5, 6, 7, 0, 1, 2], 0), 4)
        XCTAssertEqual(searchMergeCasesVersion([4, 5, 6, 7, 0, 1, 2], 0), 4)
        XCTAssertEqual(searchEnumeratedVersion([4, 5, 6, 7, 0, 1, 2], 3), -1)
        XCTAssertEqual(searchMergeCasesVersion([4, 5, 6, 7, 0, 1, 2], 3), -1)
    }

    func testS0061RotateList() throws {
        let res = LinkList(head: rotateRight(LinkList.from(array: [1, 2, 3, 4, 5]).head, 2))
        let expect = LinkList.from(array: [4, 5, 1, 2, 3])
        XCTAssertEqual(res, expect)
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

    func testS0279PerfectSquares() throws {
        XCTAssertEqual(numSquares(12), 3)
        XCTAssertEqual(numSquares(13), 2)
    }

    func testS0690EmployeeImportance() throws {
        XCTAssertEqual(getImportance(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1), 11)
        XCTAssertEqual(getImportanceV2(Employee.from([[1, 5, [2, 3]], [2, 3, []], [3, 3, []]]), 1), 11)
    }
}
