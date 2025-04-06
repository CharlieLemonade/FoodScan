//
//  OnboardingRegisterFlowView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct OnboardingRegisterFlowView: View {
    
    @State private var currentStep = 0
    private let totalSteps = 11
    
    var body: some View {
        ProgressBar(
            currentStep: $currentStep,
            totalStep: totalSteps,
            onBack: {
                if currentStep > 0 { currentStep -= 1 }
            }
        )
        
        Group {
            switch currentStep {
            case 0: Name()
            case 1: GenderSelection()
            
            default: Text("Done!")
            }
        }
        .transition(.slide) 
        .padding(.horizontal)
        
        Spacer()
        
        PrimaryButton(title: "Continue") {
            if currentStep < totalSteps {
                    currentStep += 1
                        }
                    }
        
        
    }
}

#Preview {
    OnboardingRegisterFlowView()
}
