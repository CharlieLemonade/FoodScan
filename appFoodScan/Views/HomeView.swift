//
//  HomeView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

let meals: [Meal] = [
    Meal(name: "Breakfast", imageName: "breakfast", currentCalories: 824, targetCalories: 768, completed: true),
    Meal(name: "Lunch", imageName: "sandwich", currentCalories: 810, targetCalories: 768, completed: true),
    Meal(name: "Dinner", imageName: "pasta", currentCalories: 0, targetCalories: 768, completed: false),
    Meal(name: "Snacks", imageName: "fries", currentCalories: 0, targetCalories: 256, completed: false)
]

struct HomeView: View {
    @State private var selectedMeal: Meal? = nil

    var body: some View {
        /*NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack {
                    GreenHeaderBackground()
                    Spacer()
                }
                
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 12) {
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
                            .padding(.bottom)
                            
                            HStack(spacing: 16) {
                                KcalStatView(label: "Eaten", icon: "🥗", value: 1634)
                                MacroRingView(color: AppColors.primary, value: 1190, total: 2500, label: "Kcal Left")
                                KcalStatView(label: "Burned", icon: "🔥", value: 234)
                            }
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            
                            HStack {
                                Text("Eaten")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }
                            
                            HStack(spacing: 16){
                                MacroRingEaten(color: .red, value: 168, total: 224, label: "Carbs")
                                MacroRingEaten(color: .orange, value: 168, total: 224, label: "Carbs")
                                MacroRingEaten(color: .blue, value: 168, total: 224, label: "Carbs")
                            }
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            
                            HStack {
                                Text("Burned")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                            }
                            
                            HStack(spacing: 24) {
                                VStack {
                                    Text("👣 Walking")
                                        .font(.caption)
                                        .foregroundColor(.gray)

                                    Text("100")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)

                                    Text("kcal")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)

                                Divider()
                                    .frame(height: 60)

                                VStack {
                                    HStack(alignment: .center, spacing: 8) {
                                        VStack {
                                            Text("💪 Activity")
                                                .font(.caption)
                                                .foregroundColor(.gray)

                                            Text("165")
                                                .font(.title2)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)

                                            Text("kcal")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }

                                        Button(action: {}) {
                                            Image(systemName: "plus")
                                                .font(.footnote)
                                                .foregroundColor(.black)
                                                .frame(width: 32, height: 32)
                                                .background(AppColors.primary)
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            ForEach(meals) { meal in
                                MealRow(meal: meal, onAddTap: {
                                    selectedMeal = meal
                                })
                                Divider()
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .navigationTitle("FoodScan")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("LogoFoodScanSecondary")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                    }
                }
                .navigationDestination(isPresented: Binding<Bool>(
                    get: { selectedMeal != nil },
                    set: { if !$0 { selectedMeal = nil } }
                )) {
                    if let meal = selectedMeal {
                        MealDetailView(meal: meal)
                    }
                }
            }
        }*/
        Text("Hellos")
    }
}

struct GreenHeaderBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(AppColors.primary)
            .frame(height: 300)
            .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    HomeView()
}


