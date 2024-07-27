//
//  GradientBorderCardView.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/27/24.
//

import SwiftUI

struct BorderAnimations: View {
  var CardColor: Color
  var BorderColor: Color
  var title: String
  @State var rotation: CGFloat = 0
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 260, height: 340)
        .foregroundStyle(CardColor)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .frame(width: 500, height: 200)
        .foregroundStyle(
          LinearGradient(
            gradient: Gradient(colors: [
              BorderColor.opacity(0.01), BorderColor, BorderColor,
              BorderColor.opacity(0.01),
            ]), startPoint: .top, endPoint: .bottom)
        )
        .rotationEffect(.degrees(rotation))
        .mask {
          RoundedRectangle(cornerRadius: 19, style: .continuous)
            .stroke(lineWidth: 3)
            .frame(width: 257.5, height: 337.3)

        }
      Text(title).bold()
        .font(.largeTitle)
    }
    .frame(width: 260, height: 340)
    .task {
      try? await Task.sleep(nanoseconds: 10000)
      withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
        rotation = 360
      }
    }
  }
}

struct GradientBorderCardView: View {
  var body: some View {
    ZStack {
      Color.gray.opacity(0.3).ignoresSafeArea()
      BorderAnimations(CardColor: .black, BorderColor: .blue, title: "CARD")
    }
  }
}

#Preview {
  GradientBorderCardView()
    .preferredColorScheme(.dark)
}
