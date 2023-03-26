import Foundation

public struct ICSubTimeZone {
    
    /// Defines the effective start date and time for a time zone specification.
    ///
    /// This property is REQUIRED within each `STANDARD` and `DAYLIGHT`
    ///
    /// See more in [RFC 5545](
    /// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.2.4)
    public var dtStart: Date
    
    /// A rule or repeating pattern for recurring events, to-dos, journal entries, or time zone definitions.
    ///
    /// See more in [RFC 5545](
    /// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.5.3)
    public var recurrenceRule: ICRRule?
    
    /// Specifies the customary designation for a time zone description.
    ///
    /// See more in [RFC 5545](
    /// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.3.2)
    public var timeZoneName: String?
    
    /// The offset that is in use prior to this time zone observance.
    ///
    /// See more in [RFC 5545](
    /// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.3.3)
    public var timeZoneOffsetFrom: String
    
    /// The offset that is in use in this time zone observance.
    ///
    /// See more in [RFC 5545](
    /// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.3.4)
    public var timeZoneOffsetTo: String
    
    public init(
        dtStart: Date,
        recurrenceRule: ICRRule? = nil,
        timeZoneName: String? = nil,
        timeZoneOffsetFrom: String,
        timeZoneOffsetTo: String
    ) {
        self.dtStart = dtStart
        self.recurrenceRule = recurrenceRule
        self.timeZoneName = timeZoneName
        self.timeZoneOffsetFrom = timeZoneOffsetFrom
        self.timeZoneOffsetTo = timeZoneOffsetTo
    }
}
