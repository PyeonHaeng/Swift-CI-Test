import DependencyPlugin
import EnvironmentPlugin
import ConfigurationPlugin
import ProjectDescription

public extension Project {
  static func create(
    name: String,
    targets: [Target],
    schemes: [Scheme] = [],
    options: Options = .options(automaticSchemesOptions: .disabled, disableBundleAccessors: true, disableSynthesizedResourceAccessors: true),
    packages: [Package] = [],
    settings: SettingsDictionary = ProjectEnvironment.default.baseSetting,
    additionalFiles: [FileElement] = []
  ) -> Project {
    Project(
      name: name,
      organizationName: "PyeonHaeng",
      options: options,
      packages: packages,
      settings: .settings(
        base: [
          "IPHONEOS_DEPLOYMENT_TARGET": .string("16.4"),
          "BuildIndependentTargetsInParallel": .string("YES"),
        ].merging(settings) { _, new in new },
        configurations: [.debug(name: .pyeonHaengDev), .debug(name: .githubAction)]
      ),
      targets: targets,
      schemes: schemes,
      additionalFiles: additionalFiles,
      resourceSynthesizers: [.assets(), .fonts(), .strings()]
    )
  }
}
