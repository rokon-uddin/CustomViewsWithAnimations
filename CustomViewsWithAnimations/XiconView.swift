//
//  XiconView.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/24/24.
//

import SwiftUI

struct XiconView: View {
  @State var show = false
  var body: some View {
    VStack(spacing: 9.5) {
      RoundedRectangle(cornerRadius: 10)
        .frame(width: 41, height: 3)
        .rotationEffect(.degrees(show ? -44.9 : 0), anchor: .bottomTrailing)
        .offset(y: -1.3)
      Group {
        RoundedRectangle(cornerRadius: 10)
          .frame(width: show ? 0 : 41, height: 3)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .opacity(show ? 0 : 1)
      .frame(width: 40)
      RoundedRectangle(cornerRadius: 10)
        .frame(width: 41, height: 3)
        .offset(y: 3.3)
        .rotationEffect(.degrees(show ? 44.9 : 0), anchor: .bottomTrailing)
    }

    .offset(x: show ? -4 : 0)
    .frame(width: 80, height: 80)
    .background(.gray.opacity(0.4), in: Circle())
    .padding(.top, 40)

    .onTapGesture {
      withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
        show.toggle()
      }
    }
  }
}

#Preview {
  XiconView()
    .preferredColorScheme(.dark)
}
