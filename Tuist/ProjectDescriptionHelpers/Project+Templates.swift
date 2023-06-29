import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription

public extension Project {
  static func create(
    name: String,
    targets: [Target],
    schemes: [Scheme] = [],
    options: Options = .options(disableBundleAccessors: true, disableSynthesizedResourceAccessors: true),
    packages: [Package] = [],
    settings: SettingsDictionary = [
      "IPHONEOS_DEPLOYMENT_TARGET": .string("16.4"),
      "BuildIndependentTargetsInParallel": .string("YES"),
    ],
    additionalFiles: [FileElement] = []
  ) -> Project {
    Project(
      name: name,
      organizationName: "PyeonHaeng",
      options: options,
      packages: packages,
      settings: .settings(base: settings, configurations: [.debug(name: "Dev"), .debug(name: "ActionTest")]),
      targets: targets,
      schemes: schemes,
      additionalFiles: additionalFiles,
      resourceSynthesizers: [.assets(), .fonts(), .strings()]
    )
  }
}
