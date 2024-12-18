// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-solutions",
    platforms: [.macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(
            name: "SwiftSolutions",
            targets: ["SwiftSolutions"]
        ),

        .library(
            name: "Slns0kTo1k",
            targets: ["Slns0kTo1k"]
        ),
        .library(
            name: "Slns1kTo2k",
            targets: ["Slns1kTo2k"]
        ),
        .library(
            name: "Slns2kTo3k",
            targets: ["Slns2kTo3k"]
        ),
        .library(
            name: "Slns3kTo4k",
            targets: ["Slns3kTo4k"]
        ),
        .library(
            name: "SlnsLCR",
            targets: ["SlnsLCR"]
        ),

        .library(
            name: "Base",
            targets: ["Base"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.57.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SwiftSolutions",
            dependencies: [
                "Slns0kTo1k",
                "Slns1kTo2k",
                "Slns2kTo3k",
                "Slns3kTo4k",
                "SlnsLCR",
                "Base"
            ]
        ),

        .target(
            name: "Slns0kTo1k",
            dependencies: ["Base"]
        ),
        .target(
            name: "Slns1kTo2k",
            dependencies: ["Base"]
        ),
        .target(
            name: "Slns2kTo3k",
            dependencies: ["Base"]
        ),
        .target(
            name: "Slns3kTo4k",
            dependencies: ["Base"]
        ),
        .target(
            name: "SlnsLCR",
            dependencies: ["Base"]
        ),
        .target(
            name: "Base"
        ),

        .testTarget(
            name: "SwiftSolutionsTests",
            dependencies: ["SwiftSolutions"]
        ),
        .testTarget(
            name: "Slns0kTo1kTests",
            dependencies: ["Slns0kTo1k"]
        ),
        .testTarget(
            name: "Slns1kTo2kTests",
            dependencies: ["Slns1kTo2k"]
        ),
        .testTarget(
            name: "Slns2kTo3kTests",
            dependencies: ["Slns2kTo3k"]
        ),
        .testTarget(
            name: "Slns3kTo4kTests",
            dependencies: ["Slns3kTo4k"]
        ),
        .testTarget(
            name: "SlnsLCRTests",
            dependencies: ["SlnsLCR"]
        )
    ]
)

#if os(macOS)
    for target in package.targets {
        if target.plugins == nil {
            target.plugins = []
        }
        target.plugins?.append(.plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins"))
    }
#endif
