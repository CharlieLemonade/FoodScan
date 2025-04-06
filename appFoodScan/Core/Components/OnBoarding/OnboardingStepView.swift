//
//  OnboardingStepView.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct OnboardingStepView<Content: View>: View {
    var currentStep: Int
    var totalSteps: Int
    var title: String
    var onBack: () -> Void
    var onContinue: () -> Void
    var content: () -> Content

    var body: some View {
        VStack(spacing: 24) {
            ProgressBar(
                currentStep: .constant(currentStep),
                totalStep: totalSteps,
                onBack: onBack
            )

            // Título
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .foregroundStyle(AppColors.text)

            Spacer()
            // Contenido dinámico
            content()
                .padding(.horizontal)

            Spacer()

            PrimaryButton(title: "Continue") {
                onContinue()
            }.padding(.bottom, 20)

        }
        
    
    }
}


struct OnboardingStepView_Previews: PreviewProvider {
    static var previews: some View {
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

