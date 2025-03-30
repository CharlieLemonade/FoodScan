//
//  PrimaryButton.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(AppColors.text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 56)
                .background(AppColors.primary)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
}

struct PrimaryButton_Preview: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Log in") {
            print("Log in tapped")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
