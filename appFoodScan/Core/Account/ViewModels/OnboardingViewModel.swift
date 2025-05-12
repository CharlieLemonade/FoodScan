//
//  OnboardingViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 07/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


@MainActor
class OnboardingViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var gender: String = ""
    @Published var birthday: String = ""
    @Published var height: Double = 170
    @Published var currentWeight: Double = 70
    @Published var targetWeight: Double = 65
    @Published var goals: [String] = []
    @Published var activityLevel: String = ""
    @Published var dietType: String = ""
    @Published var breakfastTime: String = ""
    @Published var dinnerTime: String = ""
    //@Published var caloriePlan: CaloriePlan? = nil

    func submitOnboarding() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "Auth", code: 401, userInfo: [NSLocalizedDescriptionKey: "No authenticated user"])
        }

        let profile = UserProfile(
            name: name,
            gender: gender,
            birthday: birthday,
            height: height,
            currentWeight: currentWeight,
            targetWeight: targetWeight,
            goals: goals,
            activityLevel: activityLevel,
            dietType: dietType
           // breakfastTime: breakfastTime,
            //dinnerTime: dinnerTime
            //caloriePlan: caloriePlan
        )

        try await UserService().saveUserProfile(profile, for: uid)
    }
}
