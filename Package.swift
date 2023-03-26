// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iCalendarParser",
    products: [
        .library(
            name: "iCalendarParser",
            targets: ["iCalendarParser"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iCalendarParser",
            dependencies: []),
        .testTarget(
            name: "iCalendarParserTests",
            dependencies: ["iCalendarParser"])
    ]
)
