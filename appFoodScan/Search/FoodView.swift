//
//  FoodView.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import SwiftUI

struct FoodView: View {
    @StateObject var viewModel: FoodViewModel
    @State private var codigo = ""

    init(viewModel: FoodViewModel = FoodViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 20) {
            // Campo de búsqueda
            HStack {
                TextField("Código del alimento", text: $codigo)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("Buscar") {
                    viewModel.buscarPorCodigo(codigo)
                }
                .buttonStyle(.borderedProminent)
                .disabled(codigo.trimmingCharacters(in: .whitespaces).isEmpty)
            }

            // Información del alimento
            if let food = viewModel.food {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nombre: \(food.nombre)")
                        .font(.title2).bold()
                    Text("Porción: \(food.porcion)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Divider()
                    Group {
                        Text("Calorías: \(food.calories.formated()) kcal")
                        Text("Carbohidratos: \(food.carbs.formated()) g")
                        Text("Proteínas: \(food.protein.formated()) g")
                        Text("Grasas: \(food.fat) g")
                        Text("Colesterol: \(food.cholesterol.formated()) mg")
                        Text("Sodio: \(food.sodium.formated()) mg")
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

            // Mensaje de error
            if let error = viewModel.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
    }
}

#Preview {
    let mockVM = FoodViewModel()
    return FoodView(viewModel: mockVM)
}
