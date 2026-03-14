// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "GeminiKit",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "GeminiKit", targets: ["GeminiKit"])],
    targets: [
        .target(name: "GeminiKit",dependencies: [], path: "Sources/GeminiKit")
    ]
)
