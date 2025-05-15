//
//  OnboardingRegisterFlowView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct OnboardingRegisterFlowView: View {
    @StateObject private var viewModel = OnboardingRegistrationViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                if viewModel.isFinished {
                    PersonalizationView(viewModel: viewModel)

                } else {
                    VStack(spacing: 0) {
                        ProgressBar(
                            currentStep: $viewModel.currentStep,
                            totalStep: viewModel.totalSteps,
                            onBack: {
                                viewModel.previousStep()
                            }
                        )
                        .padding(.top, 10)

                        VStack {
                            currentStepView()
                                .padding(.horizontal, 24)
                                .frame(maxHeight: .infinity, alignment: .top)

                            PrimaryButton(
                                title: "Continue",
                                isDisabled: !viewModel.isStepValid
                            ) {
                                viewModel.nextStep()
                            }
                            .padding(.top, 16)
                            
                        }
                        .frame(height: geometry.size.height - 80) // el resto de la pantalla
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.white)
                }
            }
            .navigationBarBackButtonHidden(true) 
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    @ViewBuilder
    func currentStepView() -> some View {
        switch viewModel.currentStep {
        case 1: Name(userProfile: $viewModel.userProfile)
        case 2: GenderSelection(userProfile: $viewModel.userProfile)
        case 3: Birthday(userProfile: $viewModel.userProfile)
        case 4: Height(userProfile: $viewModel.userProfile)
        case 5: CurrentWeight(userProfile: $viewModel.userProfile)
        case 6: TargetWeight(userProfile: $viewModel.userProfile)
        case 7: MainGoals(userProfile: $viewModel.userProfile)
        case 8: ActivityLevel(userProfile: $viewModel.userProfile)
        case 9: DietType(userProfile: $viewModel.userProfile)
        default: EmptyView()
        }
    }
}





#Preview {
    OnboardingRegisterFlowView()
}
