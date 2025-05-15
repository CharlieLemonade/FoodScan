//
//  Height.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Height: View {
    @Binding var userProfile: UserProfile
    @State private var selection = "cm"
    @State private var value: Int = 170

    var config: HeightPickerConfig {
        selection == "cm"
            ? HeightPickerConfig(min: 100, max: 220, spacing: 8)
            : HeightPickerConfig(min: 39, max: 86, spacing: 8) 
    }

    var convertedHeight: Double {
        selection == "cm" ? Double(value) : Double(value) * 2.54
    }

    var displayText: String {
        if selection == "cm" {
            return "\(value)"
        } else {
            let inches = value
            let feet = inches / 12
            let remainingInches = inches % 12
            return "\(feet)′ \(remainingInches)″"
        }
    }

    var body: some View {
        DispatchQueue.main.async {
            userProfile.height = convertedHeight
        }

        return VStack {
            Text("How tall are you?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 40)

            VStack(spacing: 60) {
                VStack {
                    ToggleSelector(options: ["cm", "ft"], selected: $selection)
                        .padding(.bottom)

                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text(displayText)
                            .font(.largeTitle.bold())
                            .contentTransition(.numericText(value: Double(value)))
                            .animation(.snappy, value: value)

                        Text(selection)
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }

                    HeightPicker(config: config, value: $value)
                        .frame(height: 80)
                        
                }
            }
            .padding()
            

            Spacer()
        }
    }
}

