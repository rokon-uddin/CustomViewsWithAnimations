//
//  DynamicMultiStepProgressBar.swift
//  CustomViewsWithAnimations
//
//  Created by Mohammed Rokon Uddin on 8/6/24.
//

import SwiftUI

struct DynamicMultiStepProgressBar: View {
  @State var currentStep = 0
  @State var numberOfSteps = 6

  var body: some View {
    VStack(spacing: 80) {
      StyleOne(currentStep: 0, numberOfSteps: $currentStep)
      StyleTwo(currentStep: 0, numberOfSteps: $currentStep)
      StyleThree(currentStep: 0, numberOfSteps: $currentStep)
      StyleFour(currentStep: 0, numberOfSteps: $currentStep)
      StyleFive(currentStep: 0, numberOfSteps: $currentStep)

      HStack {
        Button(
          action: {
            withAnimation {
              if currentStep > 0 {
                currentStep -= 1
              }
            }
          },
          label: {
            Text("Back")
          })

        Button(
          action: {
            withAnimation {
              if currentStep < numberOfSteps {
                currentStep += 1
              }
            }
          },
          label: {
            Text("Next")
          })
      }.padding(.horizontal)
    }
  }
}

struct StyleOne: View {
  var currentStep: Int
  @Binding var numberOfSteps: Int
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
      "Hello, world!") /*@END_MENU_TOKEN@*/
  }
}

struct StyleTwo: View {
  var currentStep: Int
  @Binding var numberOfSteps: Int
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
      "Hello, world!") /*@END_MENU_TOKEN@*/
  }
}

struct StyleThree: View {
  var currentStep: Int
  @Binding var numberOfSteps: Int
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
      "Hello, world!") /*@END_MENU_TOKEN@*/
  }
}

struct StyleFour: View {
  var currentStep: Int
  @Binding var numberOfSteps: Int
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
      "Hello, world!") /*@END_MENU_TOKEN@*/
  }
}

struct StyleFive: View {
  var currentStep: Int
  @Binding var numberOfSteps: Int
  var body: some View {
    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
      "Hello, world!") /*@END_MENU_TOKEN@*/
  }
}

#Preview {
  DynamicMultiStepProgressBar()
}
