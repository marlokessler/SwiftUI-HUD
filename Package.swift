// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HUD",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    
    products: [
        .library(
            name: "HUD",
            targets: ["HUD"]),
    ],
    
    dependencies: [
        .package(name: "Indicators", url: "https://github.com/Connapptivity/SwiftUI-Indicators.git", from: "1.1.0"),
    ],
    
    targets: [
        .target(
            name: "HUD",
            dependencies: ["Indicators"]),
    ]
)
