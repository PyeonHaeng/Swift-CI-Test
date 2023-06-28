//
//  SourceFilesList+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 홍승현 on 2023/06/26.
//

import ProjectDescription

public extension SourceFilesList {
  static let sources: Self = "Sources/**"
  static let unitTests: Self = "Tests/**"
  static let uiTests: Self = "UITests/**"
}
