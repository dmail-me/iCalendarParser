import Foundation

public enum DateTimeType {
    case date
    case dateTime
    
    /// Returns a configured `DateFormatter`
    public func dateFormatter(
        tzId: String? = nil
    ) -> DateFormatter {
        let formatter = DateFormatter()
        
        if let tzId {
            formatter.timeZone = TimeZone(identifier: tzId)
        } else if self == .date {
            formatter.timeZone = .current
        } else {
            formatter.timeZone = TimeZone(abbreviation: "UTC")
        }
        
        formatter.dateFormat = {
            switch self {
            case .date:
                return "yyyyMMdd"
            case .dateTime:
                return tzId == nil
                    ? "yyyyMMdd'T'HHmmss'Z'"
                    : "yyyyMMdd'T'HHmmss"
            }
        }()
        
        return formatter
    }
}
