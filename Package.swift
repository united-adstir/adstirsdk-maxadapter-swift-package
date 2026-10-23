// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdstirSDKMaxAdapter",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdstirAdsMaxAdapter",
            targets: ["AdstirAdsMaxAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            "13.1.0"..<"14.0.0"
        ),
        .package(
            url: "https://github.com/united-adstir/adstirsdk-swift-package.git",
            exact: "2.17.9"
        )
    ],
    targets: [
        .target(
            name: "AdstirAdsMaxAdapterTarget",
            dependencies: [
                .target(name: "AdstirAdsMaxAdapter"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .product(name: "AdstirAds", package: "adstirsdk-swift-package"),
            ],
            path: "Sources"
        ),
        .binaryTarget(
            name: "AdstirAdsMaxAdapter",
            url: "https://dl.ad-stir.com/sdk/spm/2.17.9/ALAdstirMediationAdapter.xcframework.zip",
            checksum: "562c1cba9183a07bf549d47b7f3b33b61844a005b4fb92a35d7ea517f1939369"
        ),
    ]
)
