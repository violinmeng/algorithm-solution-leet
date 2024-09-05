@testable import Base
@testable import Slns3kTo4k
import XCTest

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class SwiftSolutionsTests: XCTestCase {
    func testClearDigits() throws {
        XCTAssertEqual(clearDigits("cb34"), "")
        XCTAssertEqual(clearDigits("abc"), "abc")
    }
}
