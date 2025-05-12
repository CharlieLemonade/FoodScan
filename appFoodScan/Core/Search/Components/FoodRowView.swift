//
//  FoodRowView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct FoodRowView: View {
    let food: FoodItem
    let isLast: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Circle()
                    .stroke(AppColors.primary, lineWidth: 2)
                    .frame(width: 32, height: 32)
                    .overlay(Image(systemName: "plus")
                    .foregroundColor(AppColors.text))
                    .font(.caption)

                VStack(alignment: .leading, spacing: 4) {
                    Text(food.name)
                        .font(.headline)
                    Text("\(food.calories) kcal · \(food.grams) gram")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 12)

            if !isLast {
                Divider()
            }
        }
    }
}

#Preview {
    FoodRowView(
        food: FoodItem(name: "Sushi Roll", calories: 250, grams: 180),
        isLast: false
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
