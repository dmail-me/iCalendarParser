/// Identify properties that contain a recurrence rule specification.
///
/// See more in [RFC 5545](
/// https://www.rfc-editor.org/rfc/rfc5545#section-3.3.10)
public struct ICRRule {

    // MARK: - Public properties

    /// At which days (of the week/year) it should occur.
    public var byDay: [Day]?

    /// At which days of the month it should occur. Specifies a COMMA-separated
    /// list of days of the month.
    ///
    /// Valid values are 1 to 31 or -31 to -1.
    public var byDayOfMonth: [Int]? {
        didSet {
            guard let byDayOfMonth else { return }
            assert(
                byDayOfMonth.allSatisfy { (1...31).contains(abs($0)) },
                "by-day-of-month rules must be between 1 and 31 or -31 and -1: \(byDayOfMonth)"
            )
        }
    }

    /// At which days of the year it should occur. Specifies a list of days
    /// of the year.
    ///
    /// Valid values are 1 to 366 or -366 to -1.
    public var byDayOfYear: [Int]? {
        didSet {
            guard let byDayOfYear else { return }
            assert(
                byDayOfYear.allSatisfy { (1...366).contains(abs($0)) },
                "by-day-of-year rules must be between 1 and 366 or -366 and -1: \(byDayOfYear)"
            )
        }
    }

    /// At which hours of the day it should occur.
    ///
    /// Must be between 0 and 24 (exclusive).
    public var byHour: [Int]? {
        didSet {
            guard let byHour else { return }
            assert(
                byHour.allSatisfy { (0..<24).contains($0) },
                "by-hour rules must be between 0 and 24 (exclusive): \(byHour)"
            )
        }
    }

    /// At which minutes of the hour it should occur.
    ///
    /// Must be between 0 and 60 (exclusive).
    public var byMinute: [Int]? {
        didSet {
            guard let byMinute else { return }
            assert(
                byMinute.allSatisfy { (0..<60).contains($0) },
                "by-minute rules must be between 0 and 60 (exclusive): \(byMinute)"
            )
        }
    }

    /// At which months it should occur.
    ///
    /// Must be between 1 and 12 (inclusive).
    public var byMonth: [Int]? {
        didSet {
            guard let byMonth else { return }
            assert(
                byMonth.allSatisfy { (1...12).contains($0) },
                "by-month rules must be between 1 and 12: \(byMonth)"
            )
        }
    }

    /// At which seconds of the minute it should occur.
    /// Must be between 0 and 60 (inclusive).
    public var bySecond: [Int]? {
        didSet {
            guard let bySecond else { return }
            assert(
                bySecond.allSatisfy { (0...60).contains($0) },
                "by-second rules must be between 0 and 60 (inclusive): \(bySecond)"
            )
        }
    }

    /// Specifies a COMMA-separated list of values that corresponds to the nth occurrence within
    /// the set of recurrence instances specified by the rule. BYSETPOS operates on a set of
    /// recurrence instances in one interval of the recurrence rule.  For example, in a WEEKLY rule,
    /// the interval would be one week A set of recurrence instances starts at the beginning of
    /// theinterval defined by the FREQ rule part.
    ///
    /// Valid values are 1 to 366 or -366 to -1.
    /// It MUST only be used in conjunction with another BYxxx rule part.
    public var bySetPos: [Int]? {
        didSet {
            guard let bySetPos else { return }
            assert(
                bySetPos.allSatisfy { (1...366).contains(abs($0)) },
                "by-set-pos rules must be between 1 and 366 or -366 and -1: \(bySetPos)"
            )
        }
    }

    /// At which weeks of the year it should occur. Specificies a list of
    /// ordinals specifying weeks of the year.
    ///
    /// Valid values are 1 to 53 or -53 to -1.
    public var byWeekOfYear: [Int]? {
        didSet {
            guard let byWeekOfYear else { return }
            assert(
                byWeekOfYear.allSatisfy { (1...53).contains(abs($0)) },
                "by-week-of-year rules must be between 1 and 53 or -53 and -1: \(byWeekOfYear)"
            )
        }
    }

    /// The number of recurrences.
    public var count: Int? {
        willSet {
            if newValue != nil {
                until = nil
            }
        }
    }

    /// The frequency of the recurrence.
    public var frequency: Frequency

    /// At which interval the recurrence repeats (in terms of the frequency).
    /// E.g. 1 means every hour for an hourly rule, ...
    ///
    /// The default value is 1.
    public var interval: Int?

    /// The day on which the workweek starts.
    ///
    /// Monday by default.
    public var startOfWorkweek: DayOfWeek?

    /// The end date/time.
    public var until: ICDateTime? {
        willSet {
            if newValue != nil {
                count = nil
            }
        }
    }

    // MARK: - Frequency

    public enum Frequency {
        case secondly
        case minutely
        case hourly
        case daily
        case weekly
        case monthly
        case yearly

        init?(propertyName: String) {
            switch propertyName {
            case Constant.Frequency.secondly:
                self = .secondly
            case Constant.Frequency.minutely:
                self = .minutely
            case Constant.Frequency.hourly:
                self = .hourly
            case Constant.Frequency.daily:
                self = .daily
            case Constant.Frequency.weekly:
                self = .weekly
            case Constant.Frequency.monthly:
                self = .monthly
            case Constant.Frequency.yearly:
                self = .yearly
            default:
                return nil
            }
        }
    }

    public enum DayOfWeek {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday

        public var weekday: Int {
            switch self {
            case .sunday:
                return 1
            case .monday:
                return 2
            case .tuesday:
                return 3
            case .wednesday:
                return 4
            case .thursday:
                return 5
            case .friday:
                return 6
            case .saturday:
                return 7
            }
        }

        init?(propertyName: String) {
            switch propertyName {
            case Constant.DayOfWeek.monday:
                self = .monday
            case Constant.DayOfWeek.tuesday:
                self = .tuesday
            case Constant.DayOfWeek.wednesday:
                self = .wednesday
            case Constant.DayOfWeek.thursday:
                self = .thursday
            case Constant.DayOfWeek.friday:
                self = .friday
            case Constant.DayOfWeek.saturday:
                self = .saturday
            case Constant.DayOfWeek.sunday:
                self = .sunday
            default:
                return nil
            }
        }
    }

    // MARK: - Day

    public struct Day: Equatable {

        /// The week. May be negative.
        public let week: Int?

        /// The day of the week.
        public let dayOfWeek: DayOfWeek

        public init(
            week: Int? = nil,
            dayOfWeek: DayOfWeek
        ) {
            self.week = week
            self.dayOfWeek = dayOfWeek

            if let week {
                assert(
                    (1...53).contains(abs(week)),
                    "Week-of-year \(String(week)) is not between 1 and 53 or -53 and -1 (each inclusive)"
                )
            }
        }

        public static func every(_ dayOfWeek: DayOfWeek) -> Self {
            Self(dayOfWeek: dayOfWeek)
        }

        public static func first(_ dayOfWeek: DayOfWeek) -> Self {
            Self(week: 1, dayOfWeek: dayOfWeek)
        }

        public static func last(_ dayOfWeek: DayOfWeek) -> Self {
            Self(week: -1, dayOfWeek: dayOfWeek)
        }

        public static func from(_ value: String) -> Self? {
            let index = value.index(value.startIndex, offsetBy: value.count - 2)

            let dayOfWeekStr = String(value[index...])
            let weekStr = String(value[..<index])

            guard let dayOfWeek = DayOfWeek(propertyName: dayOfWeekStr) else {
                return nil
            }

            return Self(week: Int(weekStr), dayOfWeek: dayOfWeek)
        }
    }

    // MARK: - Private properties

    private var properties: [(String, [Any]?)] {
        [
            (Constant.Property.byDay, byDay),
            (Constant.Property.byDayOfMonth, byDayOfMonth),
            (Constant.Property.byDayOfYear, byDayOfYear),
            (Constant.Property.byHour, byHour),
            (Constant.Property.byMinute, byMinute),
            (Constant.Property.byMonth, byMonth),
            (Constant.Property.bySecond, bySecond),
            (Constant.Property.bySetPos, bySetPos),
            (Constant.Property.byWeekOfYear, byWeekOfYear),
            (Constant.Property.count, [count].compactMap { $0 }),
            (Constant.Property.frequency, [frequency]),
            (Constant.Property.interval, [interval].compactMap { $0 }),
            (Constant.Property.startOfWorkweek, [startOfWorkweek].compactMap { $0 }),
            (Constant.Property.until, [until].compactMap { $0 })
        ]
    }

    // MARK: - Init

    public init(
        byDay: [Day]? = nil,
        byDayOfMonth: [Int]? = nil,
        byDayOfYear: [Int]? = nil,
        byHour: [Int]? = nil,
        byMinute: [Int]? = nil,
        byMonth: [Int]? = nil,
        bySecond: [Int]? = nil,
        bySetPos: [Int]? = nil,
        byWeekOfYear: [Int]? = nil,
        count: Int? = nil,
        frequency: Frequency,
        interval: Int? = nil,
        startOfWorkweek: DayOfWeek? = nil,
        until: ICDateTime? = nil
    ) {
        self.byDay = byDay
        self.byDayOfMonth = byDayOfMonth
        self.byDayOfYear = byDayOfYear
        self.byHour = byHour
        self.byMinute = byMinute
        self.byMonth = byMonth
        self.bySecond = bySecond
        self.bySetPos = bySetPos
        self.byWeekOfYear = byWeekOfYear
        self.count = count
        self.frequency = frequency
        self.interval = interval
        self.startOfWorkweek = startOfWorkweek
        self.until = until
    }
}
