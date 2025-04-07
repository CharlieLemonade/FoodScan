//
//  HomeView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack {
            Color(.systemGray6)        .ignoresSafeArea()
            VStack {
                GreenHeaderBackground()
                Spacer()
                        }
            
            ScrollView {
                VStack(spacing: 24) {
                    HomeHeader()
                    
                    MainStatsCardView()
                }
                .padding(.vertical)
            }
        }
    }
}


struct GreenHeaderBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(AppColors.primary)
            .frame(height: 300)
            .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    HomeView()
}
