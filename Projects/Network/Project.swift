// swiftformat:disable all

import ProjectDescription

let project = Project(
  name: "Network",
  organizationName: "PyeonHaeng",
  targets: [
    Target(
      name: "PyeonHaengNetwork",
      platform: .iOS,
      product: .staticFramework,
      bundleId: "com.pyeonhaeng.network",
      sources: "Sources/**"
    ),
  ]
)
