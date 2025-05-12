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
        VStack {
            if viewModel.isFinished {
                PersonalizationView(userProfile: viewModel.userProfile)
            } else {
                ProgressBar(
                    currentStep: $viewModel.currentStep,
                    totalStep: viewModel.totalSteps,
                    onBack: {
                        viewModel.previousStep()
                    }
                )

                currentStepView()
                    .transition(.slide)
                    .padding(.horizontal)

                Spacer()

                PrimaryButton(title: "Continue") {
                    viewModel.nextStep()
                }
            }
        }
    }

    @ViewBuilder
    func currentStepView() -> some View {
        switch viewModel.currentStep {
        case 0: Name(userProfile: $viewModel.userProfile)
        case 1: GenderSelection(userProfile: $viewModel.userProfile)
        case 2: Birthday(userProfile: $viewModel.userProfile)
        case 3: Height(userProfile: $viewModel.userProfile)
        case 4: CurrentWeight(userProfile: $viewModel.userProfile)
        case 5: TargetWeight(userProfile: $viewModel.userProfile)
        case 6: MainGoals(userProfile: $viewModel.userProfile)
        case 7: DietType(userProfile: $viewModel.userProfile)
        default: EmptyView()
        }
    }
}



#Preview {
    OnboardingRegisterFlowView()
}
