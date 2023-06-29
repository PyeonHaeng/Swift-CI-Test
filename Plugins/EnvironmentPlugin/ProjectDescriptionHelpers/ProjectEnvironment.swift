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
  public let bundleID: String
  public let deploymentTarget: DeploymentTarget
  public let baseSetting: SettingsDictionary

  public static var `default`: ProjectEnvironment {
    ProjectEnvironment(
      appName: "편행",
      targetName: "PyeonHaeng",
      targetTestName: "PyeonHaengTests",
      bundleID: "com.pyeonhaeng",
      deploymentTarget: .iOS(targetVersion: "16.0", devices: .iphone),
      baseSetting: [:]
    )
  }
}
