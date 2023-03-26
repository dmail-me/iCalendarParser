import XCTest
@testable import iCalendarParser

final class DateTimeTypeTests: XCTestCase {
    func testBuildDateTime() {
        let property = ICProperty("DTSTART", "19700329T020000")
        let dateTime = PropertyBuilder.buildDateTime(from: property)

        XCTAssertNotNil(dateTime)
        XCTAssertNotNil(dateTime?.date)
        XCTAssertEqual(dateTime?.type, .dateTime)
    }

    func testDateTimeWithCorrectDate() {
        let property = ICProperty("DTSTART", "19700329T020000")
        let dateTime = PropertyBuilder.buildDateTime(from: property)!

        let date = dateTime.type.dateFormatter().date(from: "19700329T020000")
        XCTAssertEqual(dateTime.date, date)
    }

    func testDateTimeWithWrongDate() {
        let property = ICProperty("DTSTART", "19700329T020000")
        let dateTime = PropertyBuilder.buildDateTime(from: property)!

        let wrongDate = dateTime.type.dateFormatter().date(from: "19700327T020000")
        XCTAssertNotEqual(dateTime.date, wrongDate)
    }
}
