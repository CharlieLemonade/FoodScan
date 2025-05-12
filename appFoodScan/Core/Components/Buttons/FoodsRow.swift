//
//  FoodsRow.swift
//  appFoodScan
//
//  Created by Carlos López on 11/04/25.
//

import SwiftUI

struct FoodsRow: View {
    let icon: String
    let label: String
    var body: some View {
        HStack {
            
            HStack(spacing: 16) {
                Image("sandwich")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64)
                
                VStack(alignment: .leading){
                    Text(label)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(AppColors.text)
                    
                    Text("810 / 768 kcal")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                Image(systemName: "plus")
                    .foregroundColor(.gray)
            }

        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
}

#Preview {
    FoodsRow(icon: "bell", label: "Breakfast")
}
