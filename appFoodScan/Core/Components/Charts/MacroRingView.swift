//
//  MacroRingView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct MacroRingView: View {
    var color: Color
    var value: Int
    var total: Int
    var label: String

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 8)
                
                                
                Circle()
                    .trim(from: 0, to: CGFloat(value) / CGFloat(total))
                    .stroke(color, lineWidth: 8)
                    .rotationEffect(.degrees(-90))
                
                VStack(spacing: 8){
                    Text("\(value)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(label)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                

            }
            .frame(width: 120, height: 120)

            
        }
    }
}


struct MacroRingView_Previews: PreviewProvider {
    static var previews: some View {
        MacroRingView(color: AppColors.primary, value: 1190, total: 2500, label: "Kcal Left")
            .previewLayout(.sizeThatFits)
    }
}
