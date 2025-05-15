//
//  FoodView.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import SwiftUI

struct FoodView: View {
    @StateObject var viewModel = FoodViewModel()

    var body: some View {
        VStack(spacing: 20) {
            if let food = viewModel.food {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nombre: \(food.nombre)")
                        .font(.title2).bold()
                    Text("Porción: \(food.porcion)")
                        .font(.subheadline).foregroundColor(.gray)
                    Divider()
                    Group {
                        Text("Calories: \(food.calories) kcal")
                        Text("Carbohidratos: \(food.carbs) g")
                        Text("Proteínas: \(food.protein) g")
                        Text("Grasas: \(food.fat) g")
                        Text("Colesterol: \(food.cholesterol) mg")
                        Text("Sodio: \(food.sodium) mg")
                        Text("Calcio: \(food.calcium) mg")
                        Text("Hierro: \(food.iron) mg")
                        Text("Potasio: \(food.potassium) mg")
                    }
                    .padding(.leading)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.2)))
                .padding()
            }

            if let error = viewModel.errorMessage {
                Text("Error: \(error)").foregroundColor(.red)
            }

            Spacer()
        }
    }

    @State private var codigo = ""
}

#Preview {
    let mockVM = FoodViewModel()
    mockVM.food = Food(
        nombre: "100% Pure Coconut Water",
        porcion: "8 fl oz",
        carbs: "11.00",
        calories: "9",
        protein: "0",
        fat: "0",
        cholesterol: "0",
        sodium: "60",
        calcium: "34",
        iron: "0",
        potassium: "470"
    )

    return FoodView()
}
