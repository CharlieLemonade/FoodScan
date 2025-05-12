//
//  GenderSelection.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct GenderSelection: View {
    @Binding var userProfile: UserProfile
    @State private var selectedGender: GenderOption? = nil

    var body: some View {
        VStack {
            Text("What's your gender?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 90)

            StepGenderView(
                selectedGender: selectedGender,
                onSelect: { gender in
                    selectedGender = gender
                    userProfile.gender = gender.rawValue
                }
            )

            Spacer()
        }
        .onAppear {
            selectedGender = GenderOption(rawValue: userProfile.gender)
        }
    }
}


