// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HeadingIndicator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "HeadingIndicator",
            targets: ["HeadingIndicator"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HeadingIndicator",
            dependencies: []),
    ]
)
