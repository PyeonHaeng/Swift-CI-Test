//
//  Configuration+Templates.swift
//  EnvironmentPlugin
//
//  Created by 홍승현 on 2023/06/29.
//

import ProjectDescription

public extension ConfigurationName {
  static var pyeonHaengDev: Self {
    configuration("PyeonHaeng-Dev")
  }

  static var githubAction: Self {
    configuration("GithubAction")
  }
}
