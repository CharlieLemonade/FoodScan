//
//  KcalStatView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct KcalStatView: View {
    var label: String
    var icon: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 4) {
                Text(icon)
                    .font(.caption2)
                Text(label)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            Text("\(value)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(AppColors.text)
            Text("kcal")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}

struct KcalStatView_Previews: PreviewProvider {
    static var previews: some View {
            KcalStatView(label: "Eaten", icon: "🥗", value: 1634)
        .previewLayout(.sizeThatFits)
    }
}
