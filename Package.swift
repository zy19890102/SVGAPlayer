// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SVGAPlayerSDK",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SVGAPlayerSDK",
            targets: ["SVGAPlayerSDKTarget"]),
    ],
    dependencies: [.package(url: "https://github.com/ZipArchive/ZipArchive.git", exact: "2.4.3"),
                   .package(url: "https://github.com/zy19890102/Protobuf", exact: "3.26.1")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "SVGAPlayerSDK", path: "SVGAPlayerSDK/SVGAPlayerSDK.xcframework"),
        .target(name: "SVGAPlayerSDKTarget",
                dependencies: [.target(name: "SVGAPlayerSDK"),
                               .product(name: "Protobuf", package: "Protobuf"),
                               .product(name: "ZipArchive", package: "ZipArchive")],
                path: "SVGAPlayerSDKTarget")
    ]
)

