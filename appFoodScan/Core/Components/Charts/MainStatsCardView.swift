//
//  MacroInfoCard.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct MainStatsCardView: View {
    var body: some View {
        
        VStack(spacing: 24) {
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                HStack(spacing: 8) {
                    DateFormattedView()
                    Image(systemName: "calendar")
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            

            HStack(spacing: 32) {
                KcalStatView(label: "Eaten", icon: "🥗", value: 1634)
            
                MacroRingView(color: AppColors.primary, value: 1190, total: 2500, label: "Kcal Left")
                
                KcalStatView(label: "Burned", icon: "🔥", value: 234)
            }

            HStack {
                Text("Eaten")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
            }
            
            HStack(spacing: 32) {
                MacroRingEaten(color: .red, value: 168, total: 224, label: "Carbs")
                
                MacroRingEaten(color: .orange, value: 83, total: 128, label: "Protein")
                
                MacroRingEaten(color: .blue, value: 70, total: 128, label: "Fat")
            }
            
            
            HStack {
                Text("Burned")
                .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 1)
                }
            
            HStack(spacing: 86) {
                KcalStatView(label: "Walking", icon: "", value: 100)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 1, height: 72)
                
                KcalStatView(label: "Activity", icon: "", value: 165)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}


struct MainStatsCard_Previews: PreviewProvider {
    static var previews: some View {
        MainStatsCardView()
            .previewLayout(.sizeThatFits)
    }
}

