//
//  Birthday.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct Birthday: View {
    @Binding var userProfile: UserProfile
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack {
            Text("When's your birthday?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 90)

            DatePicker(
                "Select your birthday",
                selection: $selectedDate,
                in: ...Date(),
                displayedComponents: .date
            )
            .datePickerStyle(.wheel)
            .labelsHidden()
            .onChange(of: selectedDate) { newDate in
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                userProfile.birthday = formatter.string(from: newDate)
            }

            Spacer()
        }
    }
}
