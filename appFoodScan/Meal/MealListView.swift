//
//  MealRow.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct MealListView: View {
    @State private var selectedMeal: Meal? = nil

    let meals: [Meal] = [
        Meal(name: "Breakfast", imageName: "square.stack.3d.up", currentCalories: 824, targetCalories: 768, completed: true),
        Meal(name: "Lunch", imageName: "takeoutbag.and.cup.and.straw", currentCalories: 810, targetCalories: 768, completed: true),
        Meal(name: "Dinner", imageName: "leaf", currentCalories: 0, targetCalories: 768, completed: false),
        Meal(name: "Snacks", imageName: "skewer", currentCalories: 0, targetCalories: 256, completed: false)
    ]

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach(meals) { meal in
                    MealRow(meal: meal, onAddTap: {
                        selectedMeal = meal
                    })
                    Divider()
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding()
            .navigationDestination(isPresented: Binding<Bool>(
                get: { selectedMeal != nil },
                set: { if !$0 { selectedMeal = nil } }
            )) {
                if let meal = selectedMeal {
                    MealDetailView(meal: meal)
                }
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
            .previewLayout(.sizeThatFits)
    }
}

