//
//  MainGoals.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI




struct MainGoals: View {
    
    
    
    @State private var currentStep = 7
    private let totalSteps = 11
    @State private var name: String = ""
    @State private var value: Int = 0
    
    var body: some View {
        OnboardingStepView(
            currentStep: currentStep,
            totalSteps: totalSteps,
            title: "What´s your main goal \n with FoodScan?",
            onBack: {},
            onContinue: {},
            content: {
                HStack{
                    
                }
            }
        )
    }
}

#Preview {
    MainGoals()
}
