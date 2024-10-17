@testable import Base
@testable import SlnsLCR
import XCTest

// XCTest Documentation
// https://developer.apple.com/documentation/xctest

// Defining Test Cases and Test Methods
// https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods

final class SwiftSolutionsTests: XCTestCase {
    func testLCR0127TrainWays() throws {
        XCTAssertEqual(trainWays(95), 93363621)
    }
}
