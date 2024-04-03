// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "oasis-libs",
    products: [
        .library(name: "ArgumentParser", targets: ["ArgumentParser"]),
        .library(name: "StuffGenerator", targets: ["StuffGenerator"]),
        .library(name: "CommandLineTool", targets: ["CommandLineTool"]),
    ],
    targets: [
        .target(name: "ArgumentParser"),
        .target(name: "StuffGenerator"),
        .target(name: "CommandLineTool"),
        
        .testTarget(name: "ArgumentParserTests", dependencies: ["ArgumentParser"]),
        .testTarget(name: "StuffGeneratorTests", dependencies: ["StuffGenerator"]),
        .testTarget(name: "CommandLineToolTests", dependencies: ["StuffGenerator"]),
    ]
)
