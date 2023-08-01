// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WasabiLogCleaner",
	platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
		.package(url: "https://github.com/mredig/NetworkHandler.git", .upToNextMinor(from: "2.3.0")),
		.package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0"),
		.package(url: "https://github.com/mredig/SwiftlyDotEnv.git", from: "0.1.0")
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "WasabiLogCleaner",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
				"WasabiLogCleanerCore",
				.product(name: "Algorithms", package: "swift-algorithms"),
				"SwiftlyDotEnv",
            ]
        ),
		.target(
			name: "WasabiLogCleanerCore",
			dependencies: [
				"NetworkHandler",
			])
    ]
)
