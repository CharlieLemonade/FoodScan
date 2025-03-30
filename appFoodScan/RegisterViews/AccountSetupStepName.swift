//
//  AccountSetupStepName.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct AccountSetupStepName: View {
    
    @State private var currentStep = 1
    private let totalSteps = 11
    @State private var name: String = ""
    
    var body: some View {
        OnboardingStepView(
            currentStep: 1,
            totalSteps: 11,
            title: "What's your name?",
            onBack: {},
            onContinue: {},
            content: {
                TextField("Andrew", text: .constant(""))
                    .font(.title2)
                    .padding()
                    .frame(height: 60)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .multilineTextAlignment(.center)
            }
        )
    }
    
}

#Preview {
    AccountSetupStepName()
}
