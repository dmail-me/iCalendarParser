/// This property defines an "Attendee" within a calendar component.
///
/// See more in [RFC 5545](
/// https://www.rfc-editor.org/rfc/rfc5545#section-3.8.4.1)
public struct ICAttendee {

    /// Common name
    public var cname: String?

    public var email: String?

    public var nonStandardProperties: [String: String]?

    /// Participation status of attendee
    public var participationStatus: ParticipationStatus?

    public init(
        cname: String? = nil,
        email: String? = nil,
        nonStandardProperties: [String: String]? = nil,
        participationStatus: ParticipationStatus? = nil
    ) {
        self.cname = cname
        self.email = email
        self.nonStandardProperties = nonStandardProperties
        self.participationStatus = participationStatus
    }
}
