//
//  ProjectEnvironment.swift
//  DependencyPlugin
//
//  Created by 홍승현 on 2023/06/25.
//

import ProjectDescription

public struct ProjectEnvironment {
  public let appName: String
  public let targetName: String
  public let targetTestName: String
  public let prefixBundleID: String
  public let deploymentTarget: DeploymentTarget
  public let baseSetting: SettingsDictionary

  private init(appName: String, targetName: String, targetTestName: String, prefixBundleID: String, deploymentTarget: DeploymentTarget, baseSetting: SettingsDictionary) {
    self.appName = appName
    self.targetName = targetName
    self.targetTestName = targetTestName
    self.prefixBundleID = prefixBundleID
    self.deploymentTarget = deploymentTarget
    self.baseSetting = baseSetting
  }

  public static var `default`: ProjectEnvironment {
    ProjectEnvironment(
      appName: "편행",
      targetName: "PyeonHaeng",
      targetTestName: "PyeonHaengTests",
      prefixBundleID: "com.pyeonhaeng",
      deploymentTarget: .iOS(targetVersion: "16.4", devices: .iphone),
      baseSetting: [:]
    )
  }
}
