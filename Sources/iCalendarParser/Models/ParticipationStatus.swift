/// See more in [RFC 5545](
/// https://www.rfc-editor.org/rfc/rfc5545#section-3.2.12)
public enum ParticipationStatus {
    case needsAction
    case accepted
    case declined
    case tenative

    public init?(rawValue: String) {
        switch rawValue {
        case Constant.PartStat.needsAction:
            self = .needsAction
        case Constant.PartStat.accepted:
            self = .accepted
        case Constant.PartStat.declined:
            self = .declined
        case Constant.PartStat.tenative:
            self = .tenative
        default:
            return nil
        }
    }
}
