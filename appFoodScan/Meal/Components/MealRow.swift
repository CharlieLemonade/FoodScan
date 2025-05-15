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
        HStack(alignment: .center) {
            Image(meal.imageName)
                .resizable()
                .frame(width: 52, height: 52)
                .padding(.trailing, 8)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(meal.name)
                        .font(.headline
                        )
                        .fontWeight(.semibold)
                    if meal.completed {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(AppColors.primary)
                    }
                }

                HStack(alignment: .center) {
                    ProgressView(value: progress)
                        .progressViewStyle(LinearProgressViewStyle(tint: meal.completed ? AppColors.primary : .gray))
                        .frame(height: 5)

                    if meal.completed {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    } else {
                        Button(action: {
                            onAddTap?()
                        }) {
                            Circle()
                                .stroke(AppColors.primary, lineWidth: 2)
                                .frame(width: 24, height: 24)
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(AppColors.text)
                                )
                                .font(.caption)
                        }
                        .buttonStyle(.plain)
                        .padding(.leading, 8)
                    }
                }

                Text("\(meal.currentCalories) / \(meal.targetCalories) kcal")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}



struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MealRow(meal: Meal(name: "Breakfast", imageName: "square.stack.3d.up", currentCalories: 650, targetCalories: 768, completed: true))
            MealRow(meal: Meal(name: "Dinner", imageName: "pasta", currentCalories: 0, targetCalories: 768, completed: false))
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
