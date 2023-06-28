//
//  ContentView.swift
//  PyeonHaeng
//
//  Created by 홍승현 on 2023/06/25.
//  Copyright © 2023 PyeonHaeng. All rights reserved.
//

import DesignSystem
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
  var body: some View {
    HStack {
      Text(PyeonHaengStrings.Onboarding.hello)
    }
  }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
