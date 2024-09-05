// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.54.3"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.56.2"),
        .package(url: "https://github.com/SwiftGen/SwiftGen", .upToNextMajor(from: "6.6.2"))
    ],
    targets: [
        .target(name: "BuildTools", path: "")
    ]
)
