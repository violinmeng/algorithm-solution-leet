
import XCTest
@testable import Slns0kTo1k
@testable import Base

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class SwiftSolutionsTests: XCTestCase {
    
    func testTwoSum() throws {
        XCTAssertEqual(twoSum([2,7,11,15], 9), [0,1])
    }
    
    func testGetImportance() throws {
        XCTAssertEqual(getImportance(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1), 11)
        XCTAssertEqual(getImportanceV2(Employee.from([[1,5,[2,3]],[2,3,[]],[3,3,[]]]),1), 11)
    }
    
    func testRotateList() throws {
        let res = LinkList(head:rotateRight(LinkList.from(array: [1,2,3,4,5]).head, 2))
        let expect = LinkList.from(array: [4,5,1,2,3])
        XCTAssertEqual(res, expect)
    }
    
    func testPartitionList() throws {
        let res = LinkList(head:partition(LinkList.from(array: [1,4,3,2,5,2]).head, 3))
        let expect = LinkList.from(array: [1,2,2,4,3,5])
        XCTAssertEqual(res, expect)
    }
    
    func testGrayCode() throws {
        XCTAssertEqual(grayCode(2), [0,1,3,2])
        XCTAssertEqual(grayCodeV2(2), [0,1,3,2])
    }
    
    func testRotateNumsSearchII() throws {
        XCTAssertEqual(rotateNumsSearchII([2,5,6,0,0,1,2], 0), true)
        XCTAssertEqual(rotateNumsSearchII([2,5,6,0,0,1,2], 3), false)
        XCTAssertEqual(rotateNumsSearchII([3], 3), true)
        XCTAssertEqual(rotateNumsSearchII([3,1,2,3,3,3,3], 2), true)
    }
    
    func testRotateNumsSearch() throws {
        XCTAssertEqual(searchEnumeratedVersion([4,5,6,7,0,1,2], 0), 4)
        XCTAssertEqual(searchMergeCasesVersion([4,5,6,7,0,1,2], 0), 4)
        XCTAssertEqual(searchEnumeratedVersion([4,5,6,7,0,1,2], 3), -1)
        XCTAssertEqual(searchMergeCasesVersion([4,5,6,7,0,1,2], 3), -1)
    }
    
}
