// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwiftUtilities",
    products: [
        .library(
            name: "SwiftUtilities",
            targets: ["SwiftUtilities"])
    ],
    targets: [
        .target(
            name: "SwiftUtilities",
            path: "Source")
    ],
    swiftLanguageVersions: [3, 4]
)
