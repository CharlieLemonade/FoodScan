//
//  DietType.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct DietType: View {
    @Binding var userProfile: UserProfile

    let options: [(icon: String, title: String)] = [
        ("🥗", "Balanced Diet"),
        ("💪", "High Protein"),
        ("🥩", "Low Carb"),
        ("🥕", "Vegetarian"),
        ("🌿", "Vegan"),
        ("🥑", "Keto"),
        ("🍅", "Mediterranean")
    ]

    var body: some View {
        VStack {
            Text("What's your diet type?")
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
                            isSelected: userProfile.dietType == option.title
                        ) {
                            userProfile.dietType = option.title
                        }
                    }
                }
                .padding(.horizontal, 4)
            }

            Spacer()
        }
    }
}

