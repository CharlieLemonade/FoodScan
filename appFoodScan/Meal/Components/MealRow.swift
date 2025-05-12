//
//  MealRow.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal
    var onAddTap: (() -> Void)? = nil  // Acción opcional

    var progress: Double {
        min(Double(meal.currentCalories) / Double(meal.targetCalories), 1.0)
    }

    var body: some View {
        HStack {
            Image(systemName: meal.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.trailing, 8)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(meal.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    if meal.completed {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(AppColors.primary)
                    }
                }

                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: meal.completed ? AppColors.primary : .gray))
                    .frame(height: 5)

                Text("\(meal.currentCalories) / \(meal.targetCalories) kcal")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            if meal.completed {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            } else {
                Button(action: {
                    onAddTap?()
                }) {
                    Circle()
                        .stroke(AppColors.primary, lineWidth: 2)
                        .frame(width: 32, height: 32)
                        .overlay(Image(systemName: "plus")
                            .foregroundColor(AppColors.text))
                        .font(.caption)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.vertical, 12)
    }
}


struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MealRow(meal: Meal(name: "Breakfast", imageName: "square.stack.3d.up", currentCalories: 650, targetCalories: 768, completed: true))
            MealRow(meal: Meal(name: "Dinner", imageName: "leaf", currentCalories: 0, targetCalories: 768, completed: false))
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
