// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUtilities",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SwiftUtilities",
            targets: ["SwiftUtilities"]),
    ],
    targets: [
        .target(
            name: "SwiftUtilities",
            dependencies: [
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SwiftUtilitiesTests",
            dependencies: ["SwiftUtilities"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.1") ]
)
