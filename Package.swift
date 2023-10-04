// swift-tools-version:5.3
import PackageDescription


// https://sources.debian.org/src/libv8/3.8.9.20-2/include/v8.h/

let package = Package(
    name: "Wayland",
//    platforms: [
//       .macOS(.v10_15)
//    ],
    products: [
        .library(name: "MyPoint", targets: ["MyPoint"]),
        .executable(name: "Desktop", targets: ["Desktop"])
    ],
    targets: [
        .target(
            name: "MyPoint",
            path: "./Sources/MyPoint"
        ),
        .target(
            name: "Desktop",
            dependencies: [
                "MyPoint"
            ],
            path: "./Sources/Desktop"
        ),
    ]
)
