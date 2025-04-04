//
//  Name.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Name: View {
    @State private var currentStep = 1
    private let totalSteps = 11
    @State private var name: String = ""
    @State private var value: Int = 0

    var body: some View {
        OnboardingStepView(
            currentStep: currentStep,
            totalSteps: totalSteps,
            title: "What´s your name?",
            onBack: {},
            onContinue: {},
            content: {
                TextField("Andrew", text: .constant(""))
                                  .font(.title)
                                  .fontWeight(.bold)
                                  .padding()
                                  .frame(height: 80)
                                  .background(Color(.systemGray6))
                                  .cornerRadius(12)
                                  .multilineTextAlignment(.center)
            }
        )
    }
}

#Preview {
    Name()
}
