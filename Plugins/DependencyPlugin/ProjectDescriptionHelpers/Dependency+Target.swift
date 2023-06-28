import ProjectDescription

// MARK: - Feature

public enum Feature: String {
  case home

  public var targetName: String {
    "Feature" + rawValue.capitalized
  }
}

public extension TargetDependency {
  static let designSystem = TargetDependency.project(
    target: "DesignSystem", path: .relativeToRoot("Projects/DesignSystem")
  )

  static func feature(_ feature: Feature) -> TargetDependency {
    .project(
      target: feature.targetName,
      path: .relativeToFeature(feature.targetName)
    )
  }
}
