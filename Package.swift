// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScalableLayoutKit",
    platforms:[.iOS(.v8)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "ScalableLayoutKit",
            targets: ["ScalableLayoutKit"]),
    ],
    
    targets: [
        .target( name: "ScalableLayoutKit", path: "Sources"),
//        .testTarget( name: "ScalableLayoutKitTests", dependencies: ["ScalableLayoutKit"], path: "Tests"),
    ]
)

