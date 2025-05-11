//
//  MacroChartSection.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI
import Charts

struct Macro: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
}

struct MacroChartSection: View {
    var macros: [Macro]
    var totalCalories: Double

    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Chart {
                        ForEach(macros) { macro in
                            SectorMark(
                                angle: .value("Value", macro.value),
                                innerRadius: .ratio(0.8),
                                outerRadius: .ratio(1.0)
                            )
                            .foregroundStyle(by: .value("Macro", macro.name))
                        }
                    }
                    .frame(width: 140, height: 140)

                    VStack{
                        Text("\(totalCalories, specifier: "%.0f")")
                            .foregroundColor(AppColors.text)
                            .fontWeight(.bold)
                            .font(.title)
                        
                        Text("kcal")
                            .font(.caption)
                            .fontWeight(.light )
                        
                    }.padding(.bottom)
                    
                }
                
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(macros) { macro in
                        HStack {
                            Circle()
                                .fill(colorForMacro(macro.name))
                                .frame(width: 10, height: 10)

                            Text(macro.name)
                                .foregroundColor(AppColors.gray)
                                .font(.callout)
                                .fontWeight(.light)

                            
                            Text("\(macro.value, specifier: "%.1f") g   (\(percentage(for: macro), specifier: "%.1f")%)")
                                .foregroundColor(AppColors.text)
                                .font(.callout)
                                .fontWeight(.semibold)
                            

                            
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.leading, 10)
            }
            .padding(.vertical, 6)
        }
    }

    
    func colorForMacro(_ name: String) -> Color {
        switch name {
        case "Carbs": return .blue
        case "Protein": return .green
        case "Fat": return .orange
        default: return .gray
        }
    }

    
    func percentage(for macro: Macro) -> Double {
        let total = macros.reduce(0) { $0 + $1.value }
        return (macro.value / total) * 100
    }
}

struct MacroChartSection_Previews: PreviewProvider {
    static var previews: some View {
        MacroChartSection(macros: [
            Macro(name: "Carbs", value: 22.5),
            Macro(name: "Protein", value: 3.2),
            Macro(name: "Fat", value: 11.0)
        ], totalCalories: 217.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
