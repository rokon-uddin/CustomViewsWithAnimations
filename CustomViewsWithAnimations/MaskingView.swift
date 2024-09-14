//
//  MaskingView.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 8/4/24.
//

import SwiftUI

struct MaskingView: View {
  @State private var masking = 0
  var body: some View {

    VStack {
      Spacer()
      Picker("", selection: $masking) {
        Text("Mask").tag(0)
        Text("Inverted Mask").tag(1)
      }
      .pickerStyle(.segmented)
      
      Spacer()
      
      if masking == 0 {
        Image(.sonoma)
          .resizable()
          .scaledToFill()
          .ignoresSafeArea()
          .mask {
            Image(systemName: "apple.logo")
              .font(.system(size: 300))
          }
          .shadow(radius: 24)
          .tag(0)
      } else {
        InvertedMaskingView()
          .tag(1)
      }
    }

  }
}

#Preview {
  MaskingView()
}

struct InvertedMaskingView: View {
  var body: some View {
    ZStack {
      Image(.sonoma)
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()

      Image(systemName: "apple.logo")
        .font(.system(size: 300))
        .blendMode(.destinationOut)
    }
    .compositingGroup()
    .shadow(color: .gray, radius: 16, x: -8, y: 8)
  }
}
