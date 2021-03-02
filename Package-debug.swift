// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mk-apple",
    platforms: [
         .iOS(.v13)
     ],
    products: [
        .library(name: "mk-apple-A", type: .static, targets: ["mk-apple-A"]),
        .library(name: "mk-apple-B", type: .static, targets: ["mk-apple-B"]),
        .library(name: "mk-apple-C", type: .static, targets: ["mk-apple-C"]),
        .library(name: "mk-apple-D", type: .static, targets: ["mk-apple-D"])
    ],
    dependencies: [
        .package(url: "https://github.com/stareque-atlassian/Alamofire", .revision("63f7ec9fff5c4a6a05de37b11326e5a6ca8a6fbc")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .revision("19bc4037705fdf21d8defd691e400cb7f909076f"))
    ],
    targets: [
        .target(name: "mk-apple-A", dependencies: ["mk-apple-B"]),  //dependency on framework B in this Package file
        .target(name: "mk-apple-B", dependencies: []),  //dependency on a binary framework in this Package file
        .target(name: "mk-apple-C", dependencies: ["Alamofire"]), //dependency on framework Alamofire (will become binary) not in this Package file
        .target(name: "mk-apple-D", dependencies: ["SnapKit"]) //dependency on framework Alamofire (will stay source) not in this Package file
    ]
)
