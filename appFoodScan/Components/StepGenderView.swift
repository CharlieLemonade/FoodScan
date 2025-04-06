//
//  StepGenderView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

enum GenderOption: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "Prefer not to say"

    var symbol: String {
        switch self {
        case .male: return "mars"
        case .female: return "venus"
        case .other: return "questionmark"
        }
    }
}

struct StepGenderView: View {
    @State private var selectedGender: GenderOption? = nil

    var body: some View {
      
            HStack(spacing: 40) {
                genderOptionView(.male)
                genderOptionView(.female)
            }.padding(.bottom, 30)
            .animation(.easeInOut(duration: 0.2), value: selectedGender)

            Button(action: {
                selectedGender = .other
            }) {
                Text("Prefer not to say")
                    .foregroundColor(AppColors.text)
                    .fontWeight(.semibold)
                    .font(.callout)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(.white)
                    .clipShape(Capsule())
            }.overlay(
                RoundedRectangle(cornerRadius: 32)
                    .stroke(lineWidth: 0.5)
                    .foregroundColor(.gray.opacity(0.6))
            )

        
    }

    private func genderOptionView(_ option: GenderOption) -> some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(selectedGender == option ? AppColors.primary : Color(.systemGray6))
                    .frame(width: 120, height: 120)

                Image(systemName: option.symbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)
            }

            Text(option.rawValue)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(selectedGender == option ? AppColors.primary : .gray)
        }
        .onTapGesture {
            selectedGender = option
        }
    }
}

#Preview {
    StepGenderView()
}

