// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdstirSDKMaxAdapter",
    platforms: [.iOS(.v12)],
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
            exact: "2.17.6"
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
            url: "https://dl.ad-stir.com/sdk/spm/2.17.6/ALAdstirMediationAdapter.xcframework.zip",
            checksum: "f5775d29c857a118a7fab505c013cdf93f3b481d25269fc6702b90bc028be6c1"
        ),
    ]
)
