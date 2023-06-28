//
//  Target+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 홍승현 on 2023/06/26.
//

import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription

// MARK: - FeatureTarget

public enum FeatureTarget {
  case unitTest
  case uiTest
}

public extension Target {
  static let baseInfoPlist: [String: InfoPlist.Value] = [
    "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
    "UILaunchScreen": [:],
  ]
}

public extension Target {
  static func app(
    targetName: String = ProjectEnvironment.default.targetName,
    infoPlist: [String: InfoPlist.Value] = [:],
    dependencies: [TargetDependency] = [],
    testDependencies: [TargetDependency] = []
  ) -> [Target] {
    let targets = [
      Target(
        name: targetName,
        platform: .iOS,
        product: .app,
        bundleId: "\(ProjectEnvironment.default.bundleID).app",
        deploymentTarget: ProjectEnvironment.default.deploymentTarget,
        infoPlist: .extendingDefault(with: baseInfoPlist.merging(infoPlist) { _, new in new }),
        sources: .sources,
        resources: "Resources/**",
        entitlements: .relativeToApp("PyeonHaeng.entitlements"),
        scripts: [.swiftFormat, .swiftLint],
        dependencies: dependencies,
        settings: .settings(base: [:].marketingVersion("2.0.0"))
      ),
      Target(
        name: "\(targetName)Tests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "\(ProjectEnvironment.default.bundleID).appTests",
        deploymentTarget: ProjectEnvironment.default.deploymentTarget,
        infoPlist: .default,
        sources: .unitTests,
        scripts: [.swiftFormat, .swiftLint],
        dependencies: [.target(name: targetName)] + testDependencies
      ),
      Target(
        name: "\(targetName)UITests",
        platform: .iOS,
        product: .uiTests,
        bundleId: "\(ProjectEnvironment.default.bundleID).appUITests",
        deploymentTarget: ProjectEnvironment.default.deploymentTarget,
        infoPlist: .default,
        sources: .uiTests,
        scripts: [.swiftFormat, .swiftLint],
        dependencies: [.target(name: targetName)] + testDependencies
      ),
    ]
    return targets
  }

  /// Feature 모듈의 `Target`을 생성합니다.
  /// - Parameters:
  ///   - feature: Feature Module
  ///   - additionalTargets: Feature Module에서 만들 추가 타겟들
  ///   - infoPlist: Feature Module의 infoPlist
  ///   - dependencies: Feature Module의 의존성
  ///   - testDependencies: Feature Module에 만들어지는 Tests에 대한 의존성, `additionalTargets`에 Tests 옵션이 들어갈 때만 유효합니다.
  ///   - deploymentTarget: 배포 타겟을 설정합니다. 기본값은 `16.4 - iphone`입니다.
  static func feature(
    _ feature: Feature,
    additionalTargets: Set<FeatureTarget> = [],
    infoPlist: [String: InfoPlist.Value] = [:],
    dependencies: [TargetDependency] = [],
    testDependencies: [TargetDependency] = [],
    deploymentTarget: DeploymentTarget = ProjectEnvironment.default.deploymentTarget
  ) -> [Target] {
    // MARK: Feature Framework

    var projectTargets: [Target] = [
      Target(name: feature.targetName,
             platform: .iOS,
             product: .framework,
             bundleId: "\(ProjectEnvironment.default.bundleID).\(feature.targetName.lowercased())",
             deploymentTarget: deploymentTarget,
             infoPlist: .extendingDefault(
               with: ["CFBundleDisplayName": InfoPlist.Value(stringLiteral: feature.targetName)]
                 .merging(baseInfoPlist) { _, new in new }
                 .merging(infoPlist) { _, new in new }
             ),
             sources: .sources,
             resources: "Resources/**",
             scripts: [.swiftFormat, .swiftLint],
             dependencies: dependencies),
    ]

    // MARK: Unit Tests

    if additionalTargets.contains(.unitTest) {
      projectTargets.append(Target(name: "\(feature.targetName)Tests",
                                   platform: .iOS,
                                   product: .unitTests,
                                   bundleId: "\(ProjectEnvironment.default.bundleID).\(feature.targetName.lowercased())Tests",
                                   deploymentTarget: deploymentTarget,
                                   infoPlist: .default,
                                   sources: .unitTests,
                                   scripts: [.swiftFormat, .swiftLint],
                                   dependencies: testDependencies))
    }

    // MARK: UI Tests

    if additionalTargets.contains(.uiTest) {
      projectTargets.append(Target(name: "\(feature.targetName)UITests",
                                   platform: .iOS,
                                   product: .uiTests,
                                   bundleId: "\(ProjectEnvironment.default.bundleID).\(feature.targetName.lowercased())UITests",
                                   deploymentTarget: deploymentTarget,
                                   infoPlist: .default,
                                   sources: .unitTests,
                                   scripts: [.swiftFormat, .swiftLint],
                                   dependencies: testDependencies))
    }

    return projectTargets
  }
}
