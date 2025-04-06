//
//  SecondaryButton.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct SecondaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(AppColors.text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360, height: 56)
                .background(AppColors.secondaryGreen)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
}

struct SecondaryButton_Preview: PreviewProvider {
    static var previews: some View {
        SecondaryButton(title: "Sign") {
            print("Log in tapped")
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
