//
//  PrimaryButton.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var isDisabled: Bool = false
    var isLoading: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: {
            if !isDisabled && !isLoading {
                action()
            }
        }) {
            ZStack {
                Text(title)
                    .opacity(isLoading ? 0 : 1)
                    .foregroundStyle(AppColors.text)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: AppColors.text))
                }
            }
            .frame(maxWidth: 272, minHeight: 48)
            .background(isDisabled ? AppColors.primary.opacity(0.5) : AppColors.primary)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
        .disabled(isDisabled || isLoading)
    }
}

struct PrimaryButton_Preview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            PrimaryButton(title: "Log in") {
                print("Log in tapped")
            }

            PrimaryButton(title: "Loading...", isLoading: true) {}
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .frame(width: 375)
    }
}


