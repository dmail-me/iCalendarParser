import Foundation

/// The identifier for the product that created the iCalendar object.
///
/// See more in [RFC 5545](
/// https://www.rfc-editor.org/rfc/rfc5545#section-3.7.3)
public struct ICProductIdentifier {
    
    public var raw: String
    
    public var parameters: [String] {
        raw
            .components(separatedBy: "//")
            .filter { !$0.isEmpty && $0 != "-" }
    }
    
    public init(_ raw: String) {
        self.raw = raw
    }
}

extension ICProductIdentifier: Equatable {
    public static func == (lhs: ICProductIdentifier, rhs: ICProductIdentifier) -> Bool {
        lhs.parameters == rhs.parameters
    }
}
