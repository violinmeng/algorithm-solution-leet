//
//  File.swift
//  
//
//  Created by 王阿林 on 2024/9/3.
//

import XCTest
@testable import Slns0kTo1k

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
}
