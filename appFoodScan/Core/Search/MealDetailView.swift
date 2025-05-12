//
//  MealDetailView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct MealDetailView: View {
    @Environment(\.dismiss) var dismiss
    let meal: Meal

    @State private var searchText = ""
    @State private var selectedTab = "Recent"
    @State private var showScanner = false

    let tabs = ["Recent", "Favorites", "Personal"]

    let foodItems: [FoodItem] = [
        FoodItem(name: "Cheeseburger", calories: 303, grams: 150),
        FoodItem(name: "Oatmeal", calories: 150, grams: 40),
        FoodItem(name: "Grilled Chicken Salad", calories: 350, grams: 300),
        FoodItem(name: "Scrambled Eggs", calories: 160, grams: 100),
        FoodItem(name: "Sushi Roll", calories: 250, grams: 180),
        FoodItem(name: "Mashed Potatoes", calories: 240, grams: 200),
        FoodItem(name: "Pancakes", calories: 220, grams: 150)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SearchBarView(
                searchText: $searchText,
                onRefresh: {},
                onScanTap: {
                    showScanner = true
                }
            )

            QuickActionsView(onQuickLog: {}, onCreateFood: {})
            TabSelectorView(tabs: tabs, selectedTab: $selectedTab)

            ScrollView {
                FoodListView(foods: filteredFoods())
            }

            Spacer()

            // Navegación oculta al escáner
            NavigationLink(
                destination: BarcodeScannerMockView(),
                isActive: $showScanner
            ) {
                EmptyView()
            }
            .hidden()
        }
        .padding()
        .navigationTitle(meal.name)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(AppColors.text)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    func filteredFoods() -> [FoodItem] {
        guard !searchText.isEmpty else { return foodItems }
        return foodItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}


#Preview {
    NavigationStack {
        MealDetailView(meal: Meal(
            name: "Dinner",
            imageName: "leaf",
            currentCalories: 0,
            targetCalories: 768,
            completed: false
        ))
    }
}



