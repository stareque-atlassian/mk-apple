// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mk-apple",
    platforms: [
         .iOS(.v13)
     ],

    products: [
        .library(name: "Alamofire", targets: ["Alamofire"]),

        .library(name: "mk-apple-A", targets: ["mk-apple-A"]),
        .library(name: "mk-apple-B", targets: ["mk-apple-B"]),
        .library(name: "mk-apple-C", targets: ["mk-apple-C"]),

        .library(name: "mk-apple-D", targets: ["mk-apple-D"]),
    ],
    targets: [
        .binaryTarget(name: "Alamofire", path: "Alamofire.xcframework"),

        .binaryTarget(name: "mk-apple-A", path: "mk_apple_A.xcframework"), //dependency on binary framework B in this Package file
        .binaryTarget(name: "mk-apple-B", path: "mk_apple_B.xcframework"), //a simple framework
        .binaryTarget(name: "mk-apple-C", path: "mk_apple_C.xcframework"), //dependency on a binary framework Alamofire not in this Package file

        .binaryTarget(name: "mk-apple-D", path: "mk_apple_D.xcframework") //dependency on a non binary framework SnapKit  different Package file
    ]
)
