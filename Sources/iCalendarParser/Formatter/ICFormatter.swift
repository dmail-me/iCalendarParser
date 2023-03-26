import Foundation

struct ICFormatter {
    
    /// Returns a configured `DateFormatter` based on `ICDateTimeType`
    static func dateFormatter(
        type: DateTimeType,
        tzid: String? = nil
    ) -> DateFormatter {
        let formatter = DateFormatter()
        
        if let tzid {
            formatter.timeZone = TimeZone(identifier: tzid)
        } else if type == .date {
            formatter.timeZone = .current
        } else {
            formatter.timeZone = TimeZone(abbreviation: "UTC")
        }
        
        formatter.dateFormat = {
            switch type {
            case .date:
                return "yyyyMMdd"
            case .dateTime:
                return tzid == nil
                    ? "yyyyMMdd'T'HHmmss'Z'"
                    : "yyyyMMdd'T'HHmmss"
            }
        }()
        
        return formatter
    }
}
