import Foundation

public struct ICDateTime {

    public var date: Date
    public var type: DateTimeType
    public var tzId: String?

    public init(
        date: Date,
        type: DateTimeType,
        tzId: String? = nil
    ) {
        self.date = date
        self.type = type
        self.tzId = tzId
    }

    public static func date(
        from date: Date
    ) -> Self {
        Self(date: date, type: .date, tzId: nil)
    }

    public static func dateTime(
        from date: Date,
        tzId: String? = nil
    ) -> Self {
        Self(date: date, type: .dateTime, tzId: tzId)
    }
}

extension ICDateTime: Equatable {}
