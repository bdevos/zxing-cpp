// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "ZXingCpp",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ZXingCpp",
            targets: ["ZXingCpp"])
    ],
    targets: [
        .target(
            name: "ZXingCppCore",
            path: "core/src",
            exclude: ["libzint", "ZXingC.cpp", "ZXingCpp.cpp"],
            publicHeadersPath: ".",
            cxxSettings: [
                .define("ZXING_READERS")
            ]
        ),
        .target(
            name: "ZXingCpp",
            dependencies: ["ZXingCppCore"],
            path: "wrappers/ios/Sources/Wrapper",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreVideo")
            ]
        )
    ],
    cxxLanguageStandard: CXXLanguageStandard.gnucxx20
)
