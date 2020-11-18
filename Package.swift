// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MAGridView",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "MAGridView",
            targets: ["MAGridView"]
        ),
    ],
    targets: [
        .target(
            name: "MAGridView",
            path: "GridView",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "MAGridViewTests",
            dependencies: ["MAGridView"],
            path: "GridViewTests",
            exclude: ["Info.plist"]
        ),
    ]
)
