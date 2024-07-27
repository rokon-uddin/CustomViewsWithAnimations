//
//  RepeatBehavior.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/26/24.
//

import SwiftUI

struct RepeatBehavior: View {
  @State var number = 0
  var body: some View {
    HStack(spacing: 40) {
      Button(action: { number -= 1 }) {
        Image(systemName: "minus")
          .foregroundStyle(.white)
          .font(.largeTitle)
          .frame(width: 60, height: 60)
          .background(.gray.opacity(0.3), in: Circle())
      }
      .buttonRepeatBehavior(.enabled)
      Text("\(number)")
        .font(.largeTitle)
        .contentTransition(.numericText())
        .frame(width: 80)
      Button(action: { number += 1 }) {
        Image(systemName: "plus")
          .foregroundStyle(.white)
          .font(.largeTitle)
          .frame(width: 60, height: 60)
          .background(.gray.opacity(0.3), in: Circle())
      }
      .buttonRepeatBehavior(.enabled)
    }
    .animation(.default, value: number)

  }
}

#Preview {
  RepeatBehavior()
    .preferredColorScheme(.dark)
}
