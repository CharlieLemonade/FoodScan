//
//  MacroRingEaten.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct MacroRingEaten: View {
    var color: Color
    var value: Int
    var total: Int
    var label: String

    var body: some View {
        VStack (spacing: 12){
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                
                                
                Circle()
                    .trim(from: 0, to: CGFloat(value) / CGFloat(total))
                    .stroke(color, lineWidth: 8)
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 2){
                    Text("\(value)")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("/ \(total) g")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }

            }
            .frame(width: 80, height: 80)
            
            Text("\(label)")
                .font(.caption2)
                .foregroundStyle(AppColors.text)

            
        }
    }
}


struct MacroRingEaten_Previews: PreviewProvider {
    static var previews: some View {
        MacroRingEaten(color: .red, value: 168, total: 224, label: "Carbs")
            .previewLayout(.sizeThatFits)
    }
}

