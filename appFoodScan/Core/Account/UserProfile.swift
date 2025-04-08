//
//  UserProfile.swift
//  appFoodScan
//
//  Created by Carlos López on 08/04/25.
//

import Foundation

struct UserProfile: Codable {
    var name: String
    var gender: String
    var birthday: String
    var height: Double
    var currentWeight: Double
    var targetWeight: Double
    var goals: [String]
    var activityLevel: String
    var dietType: String
    var breakfastTime: String
    var dinnerTime: String
    var caloriePlan: CaloriePlan?
}

struct CaloriePlan: Codable {
    var totalCalories: Int
    var carbsPercentage: Int
    var proteinPercentage: Int
    var fatPercentage: Int
}

