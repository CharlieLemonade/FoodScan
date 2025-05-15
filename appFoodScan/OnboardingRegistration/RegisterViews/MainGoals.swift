//
//  MainGoals.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct MainGoals: View {
    @Binding var userProfile: UserProfile
    @State private var selectedOptions: Set<String> = []

    let options: [(icon: String, title: String)] = [
        ("🔥", "Lose Weight"),
        ("💪", "Gain Muscle"),
        ("⚖️", "Maintain Weight"),
        ("⚡️", "Boost Energy"),
        ("🥗", "Improve Nutrition"),
        ("🎈", "Gain Weight")
    ]

    var body: some View {
        VStack {
            Text("What's your main goal?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 5)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(options, id: \.title) { option in
                        SelectionListItem(
                            icon: option.icon,
                            title: option.title,
                            isSelected: selectedOptions.contains(option.title)
                        ) {
                            if selectedOptions.contains(option.title) {
                                selectedOptions.remove(option.title)
                            } else {
                                selectedOptions.insert(option.title)
                            }
                            userProfile.goals = Array(selectedOptions)
                        }
                    }
                }
                .padding(.horizontal, 4)
            }

            Spacer()
        }
        .onAppear {
            selectedOptions = Set(userProfile.goals)
        }
    }
}


