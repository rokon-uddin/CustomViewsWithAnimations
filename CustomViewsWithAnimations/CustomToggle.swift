//
//  CustomToggle.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 7/24/24.
//

import SwiftUI

struct CustomToggle: View {
  @State var isOn = false
  var body: some View {
    VStack(spacing: 30) {
      Toggle("Wi-Fi", systemImage: "wifi", isOn: $isOn)
      Toggle("Wi-Fi", systemImage: "wifi", isOn: $isOn)
        .labelsHidden()
      Toggle("Wi-Fi", systemImage: isOn ? "wifi" : "wifi.slash", isOn: $isOn)
            .toggleStyle(.button).contentTransition(.symbolEffect)
        Toggle("Wi-Fi", systemImage: "wifi", isOn: $isOn)
        .toggleStyle(.button).labelStyle(.titleOnly)
        Toggle("Wi-Fi", systemImage: isOn ? "wifi": "wifi.slash", isOn: $isOn)
        .toggleStyle(.button)
        .labelStyle(.iconOnly).contentTransition(.symbolEffect)
      Toggle("Wi-Fi", systemImage: "wifi", isOn: $isOn)
        .toggleStyle(CheckmarkToggleStyle())
        .contentTransition(.symbolEffect)
    }
    .font(.title)
    .tint(.purple)
    .padding()
    Toggle("", isOn: $isOn)
      .toggleStyle(CustomToggleStyle())
      .padding(.top, 40)
  }
}

#Preview {
  CustomToggle()
        .preferredColorScheme(.dark)
}

struct CustomToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: -15) {
      ZStack {
        RoundedRectangle(cornerRadius: 16).fill(
          configuration.isOn ? .green : .red
        )
        .frame(width: 60, height: 30)

        Circle().fill(.white)
          .frame(width: 28, height: 28)

          .offset(x: configuration.isOn ? 15 : -15)

          .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
              configuration.isOn.toggle()
            }
          }
      }

      .rotationEffect(.degrees(-90))
      .padding(.trailing)

      VStack(alignment: .leading, spacing: -10) {
        Text("N")
        Text("FF")
      }
      .font(.largeTitle.bold())
      .foregroundStyle(.secondary)
    }

  }
}

struct CheckmarkToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button(
      action: {
        configuration.isOn.toggle()
      },
      label: {
          Image(systemName: configuration.isOn ? "checkmark.square" : "square")
      })
  }
}
