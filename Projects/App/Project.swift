import DependencyPlugin
import EnvironmentPlugin
import ConfigurationPlugin
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
      name: ConfigurationName.pyeonHaengDev.rawValue,
      shared: true,
      buildAction: .buildAction(targets: ["\(ProjectEnvironment.default.targetName)"]),
      testAction: .targets(
        ["\(ProjectEnvironment.default.targetTestName)"],
        configuration: .pyeonHaengDev,
        options: .options(coverage: true)
      ),
      runAction: .runAction(configuration: .pyeonHaengDev),
      archiveAction: .archiveAction(configuration: .pyeonHaengDev),
      profileAction: .profileAction(configuration: .pyeonHaengDev),
      analyzeAction: .analyzeAction(configuration: .pyeonHaengDev)
    ),
    Scheme(
      name: ConfigurationName.githubAction.rawValue,
      shared: true,
      buildAction: .buildAction(targets: ["\(ProjectEnvironment.default.targetName)"]),
      testAction: .targets(
        ["\(ProjectEnvironment.default.targetTestName)"],
        configuration: .githubAction,
        options: .options(coverage: true)
      ),
      runAction: .runAction(configuration: .githubAction)
    ),
  ],
  options: .options(automaticSchemesOptions: .disabled, disableBundleAccessors: true, disableSynthesizedResourceAccessors: true)
)
