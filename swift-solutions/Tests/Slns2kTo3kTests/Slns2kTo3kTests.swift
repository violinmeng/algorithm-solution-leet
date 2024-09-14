@testable import Base
@testable import Slns2kTo3k
import XCTest

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class SwiftSolutionsTests: XCTestCase {
    func testS2390RemoveStars() throws {
        XCTAssertEqual(removeStars("leet**cod*e"), "lecoe")
        XCTAssertEqual(removeStars("erase*****"), "")
        XCTAssertEqual(removeStars("*"), "")
    }
}
