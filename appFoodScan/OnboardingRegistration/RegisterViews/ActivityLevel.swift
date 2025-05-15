//
//  ActivityLevel.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct ActivityLevel: View {
    @Binding var userProfile: UserProfile

    let options: [(icon: String, title: String, value: String)] = [
        ("🛋️", "Sedentary", "sedentary"),
        ("🚶", "Lightly Active", "light"),
        ("🏃‍♂️", "Moderately Active", "moderate"),
        ("🏋️", "Very Active", "active"),
        ("🔥", "Extra Active", "very_active")
    ]

    var body: some View {
        VStack {
            Text("What's your activity level?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 5)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(options, id: \.value) { option in
                        SelectionListItem(
                            icon: option.icon,
                            title: option.title,
                            isSelected: userProfile.activityLevel == option.value
                        ) {
                            userProfile.activityLevel = option.value
                        }
                    }
                }
                .padding(.horizontal, 4)
            }

            Spacer()
        }
    }
}




