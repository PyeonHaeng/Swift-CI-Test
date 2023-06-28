//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by 홍승현 on 2023/06/28.
//

import ProjectDescription

let layerAttribute: Template.Attribute = .required("layer")
let nameAttribute: Template.Attribute = .required("name")

let template = Template(
  description: "Modules Templates",
  attributes: [layerAttribute, nameAttribute],
  items: [
    .file(
      path: "Projects/\(layerAttribute)/\(nameAttribute)/Sources/ContentView.swift",
      templatePath: "ContentView.stencil"
    ),
    .file(
      path: "Projects/\(layerAttribute)/\(nameAttribute)/Project.swift",
      templatePath: "Project.stencil"
    ),
  ]
)
