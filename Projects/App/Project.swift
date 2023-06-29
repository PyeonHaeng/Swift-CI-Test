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
  schemes: [
    Scheme(
      name: "Dev",
      shared: true,
      buildAction: .buildAction(targets: ["\(ProjectEnvironment.default.targetName)"]),
      testAction: .targets(
        ["\(ProjectEnvironment.default.targetTestName)"],
        configuration: .configuration("Dev"),
        options: .options(coverage: true)
      ),
      runAction: .runAction(configuration: .configuration("Dev")),
      archiveAction: .archiveAction(configuration: .configuration("Dev")),
      profileAction: .profileAction(configuration: .configuration("Dev")),
      analyzeAction: .analyzeAction(configuration: .configuration("Dev"))
    ),
    Scheme(
      name: "GithubActionScheme",
      shared: true,
      buildAction: .buildAction(targets: ["\(ProjectEnvironment.default.targetName)"]),
      testAction: .targets(
        ["\(ProjectEnvironment.default.targetTestName)"],
        configuration: .configuration("ActionTest"),
        options: .options(coverage: true)
      ),
      runAction: .runAction(configuration: .configuration("ActionTest"))
    ),
  ],
  options: .options(automaticSchemesOptions: .disabled, disableBundleAccessors: true, disableSynthesizedResourceAccessors: true)
)
