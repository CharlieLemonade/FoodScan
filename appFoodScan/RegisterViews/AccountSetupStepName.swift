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
        
        VStack {
            ProgressBar(currentStep: $currentStep, totalStep: totalSteps, onBack: {
                if currentStep > 1 {
                    currentStep -= 1
                }
            })
            
            Text("What´s your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(AppColors.text)
                .padding(.top)
            
            

            Spacer()

            TextField("", text: $name)
                .placeholder(when: name.isEmpty) {
                        Text("Andrew")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.text)
                    }  .frame(height: 86)
                        .frame(maxWidth: .infinity)
                        .background(AppColors.background)
                            .cornerRadius(12)
                            .padding(.horizontal, 20)
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            )


            Spacer()
            
            
            Button("Siguiente") {
                if currentStep < totalSteps {
                    currentStep += 1
                }
            }
            .padding()
        }
    }
    
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}


#Preview {
    AccountSetupStepName()
}
