import XCTest
@testable import iCalendarParser

final class GetPropertiesTests: XCTestCase {
    func testCreateProperties() {
        let rawIcs = """
        BEGIN:VCALENDAR\r\nPRODID:-//Example Inc//Calendar//EN\r\nVERSION:2.0
        """
        
        let parser = ICParser()
        let properties = parser.getProperties(from: rawIcs)
        
        XCTAssertTrue(!properties.isEmpty)
        XCTAssertEqual(properties.count, 3)
    }
    
    func testPropertiesShouldNotIncludeSpace() {
        let rawIcs = """
        ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE\r\n ;CN=example@mail.com;X-NUM-GUESTS=0:mailto:example@mail.com
        """
        
        let parser = ICParser()
        let properties = parser.getProperties(from: rawIcs)
        
        XCTAssertTrue(properties.filter { $0.name.contains(" ")}.isEmpty)
    }
    
    func testCreatePropertiesWithNewLine() {
        let rawIcs = """
        ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE\r\n ;CN=example@mail.com;X-NUM-GUESTS=0:mailto:example@mail.com
        """
        
        let parser = ICParser()
        let properties = parser.getProperties(from: rawIcs)
        
        XCTAssertTrue(!properties.isEmpty)
        XCTAssertEqual(properties.count, 1)
        XCTAssertEqual(properties.first?.name, "ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE;CN=example@mail.com;X-NUM-GUESTS=0")
    }
}
