//
//  MealCard.swift
//  appFoodScan
//
//  Created by Carlos López on 11/04/25.
//

import SwiftUI

struct MealCard: View {
    let name: String
    let icon: String // Puede ser nombre de imagen o SF Symbol
    let consumed: Int
    let goal: Int
    var onAdd: () -> Void = {}

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: icon) // Cambia a Image(icon) si usas assets
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.headline)

                Text("\(consumed) / \(goal) kcal")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                ProgressView(value: Float(consumed), total: Float(goal))
                    .accentColor(.green)
            }

            Spacer()

            Button(action: onAdd) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.green)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}


