import Foundation

struct ICDateTimes {
    
    var dates: [Date]
    var type: DateTimeType
    var tzId: String?
    
    init(
        dates: [Date],
        type: DateTimeType,
        tzId: String? = nil
    ) {
        self.dates = dates
        self.type = type
        self.tzId = tzId
    }
    
    static func date(
        from dates: [Date]
    ) -> Self {
        Self(dates: dates, type: .date, tzId: nil)
    }
    
    static func dateTime(
        from dates: [Date],
        tzId: String? = nil
    ) -> Self {
        Self(dates: dates, type: .dateTime, tzId: tzId)
    }
}
