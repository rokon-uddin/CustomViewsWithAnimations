//
//  DashLineProgress.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/24/24.
//

import SwiftUI

struct DashLineProgress: View {
  @State var progress: CGFloat = 0.5
  var body: some View {
      VStack(spacing: 40) {
      ProgressView(value: progress)
        .progressViewStyle(
          DashLineProgressStyle(
            totalWidth: 300, dashWidth: 8, dashSpacing: 2))
      Button {
        withAnimation {
          progress = CGFloat.random(in: 0...1)
        }
      } label: {
        Text("random")
      }
    }
    .padding(.top, 40)

  }
}

#Preview {
  DashLineProgress()
        .preferredColorScheme(.dark)
}

struct DashLineProgressStyle: ProgressViewStyle {
  var totalWidth: CGFloat
  var dashWidth: CGFloat
  var dashSpacing: CGFloat
  func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .leading, spacing: 5) {

      Text("\(Int((configuration.fractionCompleted ?? 0) * 100)) %").font(
        .title3.bold()
      )
      .contentTransition(.numericText())

      ZStack(alignment: .leading) {

        Rectangle().stroke(lineWidth: 2)
          .frame(width: totalWidth + 4, height: 20)

        HStack(spacing: dashSpacing) {

          ForEach(
            0..<Int(
              ((configuration.fractionCompleted ?? 0)
                * totalWidth) / (dashWidth + dashSpacing)),
            id: \.self
          ) { item in

            Rectangle()
              .frame(width: dashWidth, height: 15)

          }

        }
        .offset(x: 3)
      }
    }
    .foregroundStyle(.green)
  }
}
