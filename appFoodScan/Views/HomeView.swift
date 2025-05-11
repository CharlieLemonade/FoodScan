//
//  HomeView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack {
                    GreenHeaderBackground()
                    Spacer()
                }
            ScrollView {
                
                    
                VStack (spacing: 16) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Spacer()
                        HStack(spacing: 8) {
                            DateFormattedView()
                            
                            Image(systemName: "calendar")
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding()
                    
                    HStack(spacing: 28) {
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
                    
                    
                    
                    
                    
                    
                    
                    
                }
                    .padding()
                    .background(.white)
                    .cornerRadius(12)
                    .padding()
                
                
                VStack {
                    VStack(spacing: 1) {
                        FoodsRow(icon: "Sandwich", label: "Breakfast")
                        FoodsRow(icon: "Sandwich", label: "Breakfast")
                        FoodsRow(icon: "Sandwich", label: "Breakfast")
                        FoodsRow(icon: "Sandwich", label: "Breakfast")
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                }
                
                }
            
            }
            
        }
        
     /*   NavigationStack {
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
                    .padding(
                        
                    )
                    .padding()
                    .padding(.vertical)
                }
            }
        }*/
        
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
