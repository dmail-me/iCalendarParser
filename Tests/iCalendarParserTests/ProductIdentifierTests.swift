import XCTest
@testable import iCalendarParser

final class ProductIdentifierTests: XCTestCase {
    func testProductIdentifierParameters() {
        let raw = "-//Example Inc//Example Calendar 99.99//EN"
        
        let prodIdParams = ICProductIdentifier(raw).parameters
        
        XCTAssertFalse(prodIdParams.contains("-"))
        XCTAssertNotEqual(prodIdParams.count, 0)
    }
}
