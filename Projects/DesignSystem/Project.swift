// swiftformat:disable all

import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
  name: "DesignSystem",
  targets: [
    Target(
      name: "DesignSystem",
      platform: .iOS,
      product: .framework,
      bundleId: "com.pyeonhaeng.designsystem",
      deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
      sources: .sources,
      resources: "Resources/**",
      scripts: [.swiftFormat, .swiftLint]
    ),
    Target(
      name: "DesignSystemTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "com.pyeonhaeng.designsystemTests",
      deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
      sources: .unitTests,
      scripts: [.swiftFormat, .swiftLint]
    ),
  ]
)

//let project = Project(
//  name: "DesignSystem",
//  organizationName: "PyeonHaeng",
//  options: .options(automaticSchemesOptions: .disabled, disableBundleAccessors: true, disableSynthesizedResourceAccessors: true),
//  settings: .settings(
//    base: [
//      "IPHONEOS_DEPLOYMENT_TARGET": .string("16.4"),
//      "BuildIndependentTargetsInParallel": .string("YES"),
//    ],
//    configurations: [.debug(name: .pyeonHaengDev), .debug(name: .githubAction)]
//  ),
//  targets: [
//    Target(
//      name: "DesignSystem",
//      platform: .iOS,
//      product: .framework,
//      bundleId: "com.pyeonhaeng.designsystem",
//      deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
//      sources: .sources,
//      resources: "Resources/**",
//      scripts: [.swiftFormat, .swiftLint]
//    ),
//    Target(
//      name: "DesignSystemTests",
//      platform: .iOS,
//      product: .unitTests,
//      bundleId: "com.pyeonhaeng.designsystemTests",
//      deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
//      sources: .unitTests,
//      scripts: [.swiftFormat, .swiftLint]
//    ),
//  ]
//)
