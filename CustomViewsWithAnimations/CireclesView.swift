//
//  CireclesView.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/24/24.
//

import SwiftUI

struct CireclesView: View {
  @State var degrees: CGFloat = 0
  @State var degrees2: CGFloat = 0
  @State var degrees3: CGFloat = 0
  var body: some View {
    ZStack {
      CircleView(width: 80, height: 80, degrees: degrees, color: .blue)
      CircleView(width: 60, height: 60, degrees: degrees3, color: .yellow)
      CircleView(width: 40, height: 40, degrees: degrees2, color: .red)
    }
    .task {
      try? await Task.sleep(nanoseconds: 10000)
      withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
        degrees = 360
      }
      withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: false)) {
        degrees2 = 360
      }
      withAnimation(.linear(duration: 0.9).repeatForever(autoreverses: false)) {
        degrees3 = 360
      }
    }
  }
}

#Preview {
  CireclesView()
    .preferredColorScheme(.dark)
}
struct CircleView: View {
  var width: CGFloat
  var height: CGFloat
  var degrees: CGFloat
  var color: Color
  var body: some View {
    Circle().trim(from: 0, to: 0.5)
      .stroke(
        style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
      )
      .frame(width: width, height: height)
      .rotationEffect(.degrees(degrees))
      .foregroundStyle(color)
  }
}
