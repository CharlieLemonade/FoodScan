//
//  FoodItem.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let grams: Int
}
