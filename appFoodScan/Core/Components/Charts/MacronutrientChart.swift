//
//  MacronutrientChart.swift
//  appFoodScan
//
//  Created by Carlos López on 09/05/25.
//

import SwiftUI

struct MacronutrientChart: View {
    let kcal: Int
    let carbs: Double
    let protein: Double
    let fat: Double

    var body: some View {
        VStack {
            Text("\(kcal) kcal")
                .font(.largeTitle)
            HStack(spacing: 16) {
                NutrientLabel(color: .red, name: "Carbs", value: carbs, percent: 35)
                NutrientLabel(color: .orange, name: "Protein", value: protein, percent: 25)
                NutrientLabel(color: .blue, name: "Fat", value: fat, percent: 40)
            }
        }
    }
}

struct NutrientLabel: View {
    let color: Color
    let name: String
    let value: Double
    let percent: Int

    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 8, height: 8)
            Text("\(name): \(value, specifier: "%.1f")g (\(percent)%)")
                .font(.subheadline)
        }
    }
}


struct MacronutrientChart_Previews: PreviewProvider {
    static var previews: some View {
        MacronutrientChart(kcal: 218, carbs: 14.7, protein: 10.5, fat: 16.8)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
