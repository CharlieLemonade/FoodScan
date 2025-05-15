//
//  Card.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import SwiftUI

struct Card: View {
    let food: Food
    @State private var customPortion: Double = 100.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        VStack(spacing: 1) {
                            VStack(spacing: 4)
                            {
                                if let emoji = food.emoji {
                                    Text(emoji)
                                        .font(.system(size: 60))
                                        .frame(width: 72, height: 72)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                } else {
                                    Image("Kit-Kat-Logo") // Puedes cambiar por un placeholder genérico
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.top)
                            
                            
                            Text(food.nombre)
                                .font(.title2)
                                .fontWeight(.semibold)
                            
                            Divider().padding()
                            
                            let factor = customPortion / 100.0
                            
                            MacroChartSection(macros: [
                                Macro(name: "Carbs", value: food.carbs * factor),
                                Macro(name: "Protein", value: food.protein * factor),
                                Macro(name: "Fat", value: food.fat * factor)
                            ], totalCalories: food.calories * factor)
                            .padding(.horizontal)
                            
                            Divider().padding()
                            
                            VStack(spacing: 16) {
                                nutrientRow(name: "Cholesterol", value: food.cholesterol * factor)
                                nutrientRow(name: "Sodium", value: food.sodium * factor)
                            }
                            
                            HStack {
                                Text("Minerals")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }.padding()
                            
                            VStack(spacing: 16) {
                                nutrientRow(name: "Calcium", value: food.calcium * factor)
                                nutrientRow(name: "Iron", value: food.iron * factor)
                                nutrientRow(name: "Potassium", value: food.potassium * factor)
                            }
                            .padding(.bottom)
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundStyle(AppColors.text)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation(.snappy) { }
                        } label: {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundStyle(AppColors.text)
                        }
                    }
                }
                .overlay(alignment: .bottom) {
                    VStack {
                        Divider().padding(.bottom)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Serving")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                                
                                HStack {
                                    Text("\(Int(customPortion)) g")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(AppColors.text)
                                    
                                    Button {
                                        withAnimation(.snappy) { }
                                    } label: {
                                        Image(systemName: "square.and.pencil")
                                            .imageScale(.medium)
                                            .foregroundStyle(.gray)
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 16) {
                                Button {
                                    if customPortion > 50 {
                                        customPortion -= 50
                                    }
                                } label: {
                                    Circle()
                                        .stroke(AppColors.primary, lineWidth: 2)
                                        .frame(width: 32, height: 32)
                                        .overlay(
                                            Image(systemName: "minus")
                                                .foregroundColor(AppColors.text)
                                        )
                                        .font(.caption)
                                }
                                
                                Text("\(Int(customPortion))")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Button {
                                    customPortion += 50
                                } label: {
                                    Circle()
                                        .stroke(AppColors.primary, lineWidth: 2)
                                        .frame(width: 32, height: 32)
                                        .overlay(
                                            Image(systemName: "plus")
                                                .foregroundColor(AppColors.text)
                                        )
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            PrimaryButton(title: "+ Add") {
                                // Acción al añadir la porción seleccionada
                            }
                        }
                    }
                    .background(.white)
                }
            }
        }
    }
    
    private func nutrientRow(name: String, value: Double) -> some View {
        HStack {
            Text(name)
                .fontWeight(.light)
            Spacer()
            Text("\(Int(value)) mg")
                .fontWeight(.semibold)
        }
        .font(.caption)
        .foregroundColor(AppColors.text)
        .padding(.horizontal)
    }
}

#Preview {
    Card(food: MOCK_FOOD[0])
}

