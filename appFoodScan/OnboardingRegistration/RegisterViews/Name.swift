//
//  Name.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Name: View {
    @Binding var userProfile: UserProfile

    var body: some View {
        VStack {
            Text("What’s your name?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 90)

            TextField("Andrew", text: $userProfile.name)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .frame(height: 80)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .multilineTextAlignment(.center)

            Spacer()
        }
    }
}

