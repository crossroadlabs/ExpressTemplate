import PackageDescription

let package = Package(
    name: "template",
    dependencies: [
        .Package(url: "https://github.com/crossroadlabs/Express.git", majorVersion: 0, minor: 3),
    ]
)
