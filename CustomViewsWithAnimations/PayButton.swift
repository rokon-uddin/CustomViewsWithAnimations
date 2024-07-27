//
//  PayButton.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/26/24.
//

import SwiftUI

struct PayButton: View {
  @State var show = false
  @State var showprogress = false
  @State var progress = false
  @State var Yoffset: CGFloat = 62
  var action: () -> Void
  var body: some View {
    VStack {
      Spacer()
      ZStack {
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 40).foregroundStyle(.white)
          RoundedRectangle(cornerRadius: 40).foregroundStyle(.green)
            .frame(width: progress ? 250 : 0)
            .opacity(showprogress ? 1 : 0)
        }
        .frame(width: 250, height: show ? 20 : 55)
        VStack(spacing: 100) {
          Text("Pay Now").foregroundStyle(.black)
          Label("Paid", systemImage: "checkmark.circle.fill")
            .foregroundStyle(.white)
        }.font(.title3).bold().offset(y: Yoffset)
      }.frame(height: 55).clipped()
        .animation(.spring, value: show)
        .animation(.spring, value: Yoffset)
        .animation(.spring, value: progress)
      Spacer()
    }
    .frame(height: 55)
    .onTapGesture {
      Yoffset -= 60
      showprogress = true
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        show = true
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        progress = true
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        show = false
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        Yoffset -= 63
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        showprogress = false
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        withAnimation(.none) {
          progress = false
          Yoffset = 62
        }
        action()
      }

    }
  }
}
struct HomeView: View {
  var body: some View {
    PayButton(action: {})
  }
}

#Preview {
  HomeView()
    .preferredColorScheme(.dark)
}
