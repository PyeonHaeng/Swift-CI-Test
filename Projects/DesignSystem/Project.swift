// swiftformat:disable all

import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "DesignSystem",
  organizationName: "PyeonHaeng",
  targets: [
    Target(
      name: "DesignSystem",
      platform: .iOS,
      product: .framework,
      bundleId: "com.pyeonhaeng.designsystem",
      sources: .sources,
      resources: "Resources/**",
      scripts: [.swiftFormat, .swiftLint]
    ),
    Target(
      name: "DesignSystemTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "com.pyeonhaeng.designsystemTests",
      sources: .unitTests,
      scripts: [.swiftFormat, .swiftLint]
    ),
  ]
)
