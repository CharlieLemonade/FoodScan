//
//  Meal.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import Foundation

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let currentCalories: Int
    let targetCalories: Int
    let completed: Bool
}


