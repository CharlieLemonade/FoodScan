//
//  OnboardingViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import Foundation
import SwiftUI

class OnboardingRegistrationViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var userProfile = UserProfile()

    let totalSteps = 7

    var isFinished: Bool {
        currentStep > totalSteps
    }

    func nextStep() {
        if currentStep <= totalSteps {
            currentStep += 1
        }
    }

    func previousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}

