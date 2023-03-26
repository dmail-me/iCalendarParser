import XCTest
@testable import iCalendarParser

final class RRuleTests: XCTestCase {
    func testBuildRRule() {
        let property = ICProperty("RRULE", "FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU")
        let rrule = PropertyBuilder.buildRRule(from: property)
        
        XCTAssertNotNil(rrule)
        XCTAssertEqual(rrule?.frequency, .yearly)
        XCTAssertEqual(rrule?.byMonth, [3])
        XCTAssertEqual(rrule?.byDay, [.init(week: -1, dayOfWeek: .sunday)])
    }
}
