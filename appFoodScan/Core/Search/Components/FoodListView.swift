//
//  FoodListView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct FoodListView: View {
    let foods: [FoodItem]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(foods.indices, id: \.self) { i in
                FoodRowView(food: foods[i], isLast: i == foods.count - 1)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}


#Preview {
    let sampleFoods = [
        FoodItem(name: "Cheeseburger", calories: 303, grams: 150),
        FoodItem(name: "Grilled Chicken Salad", calories: 350, grams: 300),
        FoodItem(name: "Oatmeal", calories: 150, grams: 40)
    ]
    
    return FoodListView(foods: sampleFoods)
        .padding()
        .previewLayout(.sizeThatFits)
        .background(Color(.systemGroupedBackground))
}
