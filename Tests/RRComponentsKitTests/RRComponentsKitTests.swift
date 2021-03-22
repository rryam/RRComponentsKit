import XCTest
@testable import RRComponentsKit

final class RRComponentsKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RRComponentsKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
