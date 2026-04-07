// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "GeminiKitAPI",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "GeminiKitAPI", targets: ["GeminiKitAPI"])],
    targets: [
        .target(name: "GeminiKitAPI", dependencies: [], path: "Sources/GeminiKit")
    ]
)
