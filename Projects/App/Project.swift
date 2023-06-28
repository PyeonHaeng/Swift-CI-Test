import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let targets: [Target] = Target.app(dependencies: [
  .designSystem,
])

let project = Project.create(
  name: "PyeonHaeng",
  targets: targets,
  options: .options()
)
