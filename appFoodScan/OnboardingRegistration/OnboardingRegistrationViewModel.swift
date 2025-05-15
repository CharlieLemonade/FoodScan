//
//  OnboardingViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import Foundation
import SwiftUI

class OnboardingRegistrationViewModel: ObservableObject {
    @Published var currentStep: Int = 1
    @Published var userProfile = UserProfile()
    @Published var caloriePlan: CaloriePlan?
    @Published var isLoadingPlan: Bool = false
    
    var isStepValid: Bool {
        switch currentStep {
        case 1:
            return !userProfile.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case 2:
                return GenderOption(rawValue: userProfile.gender) != nil
        case 3:
            return !userProfile.birthday.isEmpty
        case 4:
            return userProfile.height > 0
        case 5:
            return userProfile.currentWeight > 0
        case 6:
            return userProfile.targetWeight > 0
        case 7:
            return !userProfile.goals.isEmpty
        case 8:
            return !userProfile.activityLevel.isEmpty
        case 9:
            return !userProfile.dietType.isEmpty
        default:
            return true
        }
    }


    let totalSteps = 9

    var isFinished: Bool {
        currentStep > totalSteps
    }

    func nextStep() {
        if currentStep <= totalSteps {
            currentStep += 1
        }
    }

    func previousStep() {
        if currentStep > 1 {
            currentStep -= 1
        }
    }
}

