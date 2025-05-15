
//  PlanReady.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct PersonalizationView: View {
    @ObservedObject var viewModel: OnboardingRegistrationViewModel
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?
    @State private var showPlan = false
    @State private var caloriePlan: CaloriePlan?
    @State private var hasTriedFetch = false

    var body: some View {
        ZStack {
            if showPlan, let plan = caloriePlan {
                CaloriePlanView(plan: plan)
                    .transition(.opacity)
            } else {
                VStack {
                    // Botón de cierre
                    HStack {
                        Button(action: {
                            timer?.invalidate()
                        }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .padding()
                        Spacer()
                    }

                    Text("Personalizing your FoodScan experience...")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(AppColors.text)
                        .padding(.bottom, 20)

                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 12)
                            .frame(width: 220, height: 220)

                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(AppColors.primary, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                            .frame(width: 220, height: 220)
                            .animation(.easeInOut(duration: 0.2), value: progress)

                        Text("\(Int(progress * 100))%")
                            .font(.system(size: 50))
                            .fontWeight(.semibold)
                    }

                    Spacer()

                    Text("Hang tight! We're crafting a personalized plan just for you.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                    Spacer()
                }
                .transition(.opacity)
            }
        }
        .onAppear {
            print("🧾 User Profile:")
                print("Name: \(viewModel.userProfile.name)")
                print("Gender: \(viewModel.userProfile.gender)")
                print("Birthday: \(viewModel.userProfile.birthday)")
                print("Height: \(viewModel.userProfile.height) cm")
                print("Current Weight: \(viewModel.userProfile.currentWeight) kg")
                print("Target Weight: \(viewModel.userProfile.targetWeight) kg")
                print("Goals: \(viewModel.userProfile.goals)")
                print("Diet Type: \(viewModel.userProfile.dietType)")
            startProgress()

            if !hasTriedFetch {
                hasTriedFetch = true
                CaloriePlanService.fetch(for: viewModel.userProfile) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let plan):
                            self.caloriePlan = plan
                            viewModel.caloriePlan = plan
                        case .failure(let error):
                            print("❌ Error fetching calorie plan: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
        .animation(.easeInOut(duration: 0.6), value: showPlan)
    }

    func startProgress() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            if progress < 1.0 {
                progress += 0.01
            } else {
                timer?.invalidate()
                showPlan = true
            }
        }
    }
}







