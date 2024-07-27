//
//  RootView.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/24/24.
//

import SwiftUI

struct RootView: View {
  var body: some View {
    NavigationStack {
      Form {
        Section {
          NavigationLink("CirclesView") {
            CireclesView()
          }
          NavigationLink("CustomToggle") {
            CustomToggle()
          }
          NavigationLink("DashLineProgress") {
            DashLineProgress()
          }
          NavigationLink("PayButton") {
            PayButton {}
          }
          NavigationLink("RepeatBehavior") {
            RepeatBehavior()
          }
          NavigationLink("XiconView") {
            XiconView()
          }
          NavigationLink("ScrollableGradientNavigationStack") {
            ScrollableGradientNavigationStack(
              heightPercentage: 0.4, maxHeight: 200, minHeight: 0,
              startColor: Color.red,
              endColor: Color.white, navigationTitle: "Test",
              content: { ForEach(0..<120) { value in Text("Test \(value)") } }
            )
            .preferredColorScheme(.dark)
          }
        }
      }
      .navigationTitle("Custom Views")
    }
  }
}

#Preview {
  RootView()
    .preferredColorScheme(.dark)
}
