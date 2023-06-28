//
//  Path+Templates.swift
//  DependencyPlugin
//
//  Created by 홍승현 on 2023/06/26.
//

import ProjectDescription

public extension Path {
  static func relativeToFeature(_ path: String) -> Self {
    .relativeToRoot("Projects/Feature/\(path)")
  }

  static func relativeToApp(_ path: String) -> Self {
    .relativeToRoot("Projects/App/\(path)")
  }
}
