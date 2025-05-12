//
//  UserProfile.swift
//  appFoodScan
//
//  Created by Carlos López on 08/04/25.
//

import Foundation

struct UserProfile: Codable {
    var name: String = ""
    var gender: String = ""
    var birthday: String = ""
    var height: Double = 0
    var currentWeight: Double = 0
    var targetWeight: Double = 0
    var goals: [String] = []
    var activityLevel: String = ""
    var dietType: String = ""
}


/*struct CaloriePlan: Codable {
    var totalCalories: Int
    var carbsPercentage: Int
    var proteinPercentage: Int
    var fatPercentage: Int
}
*/
