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
            
            VStack {
                GreenHeaderBackground()
                Spacer()
                        }
            
            ScrollView {
                VStack(spacing: 24) {
                    HomeHeader()
                    
                    HStack {
                        Image(systemName: "chevron.left")
                        Spacer()
                        HStack(spacing: 8) {
                            Text("Today, Dec 22")
                                .font(.headline)
                            Image(systemName: "calendar")
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal)
                    
                    // Calorie ring + Summary
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                            Circle()
                                .trim(from: 0, to: 0.6)
                                .stroke(Color.green, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                                .rotationEffect(.degrees(-90))
                            VStack {
                                Text("1190")
                                    .font(.title)
                                    .bold()
                                Text("kcal left")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: 140, height: 140)
                        
                        HStack {
                            VStack {
                                Text("1634")
                                    .font(.headline)
                                    .bold()
                                Text("Eaten")
                                    .font(.caption)
                                Text("kcal")
                                    .font(.caption2)
                            }
                            Spacer()
                            VStack {
                                Text("265")
                                    .font(.headline)
                                    .bold()
                                Text("Burned")
                                    .font(.caption)
                                Text("kcal")
                                    .font(.caption2)
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                    
                    // Macronutrients
                    HStack(spacing: 16) {
                        MacroRingView(color: .red, value: 168, total: 224, label: "Carbs")
                        MacroRingView(color: .orange, value: 83, total: 128, label: "Protein")
                        MacroRingView(color: .blue, value: 70, total: 128, label: "Fat")
                    }
                    
                    // Burned Section
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Burned")
                            .font(.headline)
                        
                        HStack {

                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
    }
}

/*struct MacroRingView: View {
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
                Text("\(value)")
                    .font(.caption)
                    .bold()
            }
            .frame(width: 50, height: 50)

            Text(label)
                .font(.caption)
        }
    }
}*/



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
