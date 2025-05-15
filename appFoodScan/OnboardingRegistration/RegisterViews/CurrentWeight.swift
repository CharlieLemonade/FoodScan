//
//  AccountSetupStepName.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct CurrentWeight: View {
    @Binding var userProfile: UserProfile
    @State private var selection = "kg"
    @State private var value: Int = 0

    var config: WeightPickerConfig {
        selection == "kg"
            ? WeightPickerConfig(min: 30, max: 200, spacing: 8)
            : WeightPickerConfig(min: 66, max: 440, spacing: 8)
    }

    var body: some View {
        let rawWeight = CGFloat(value)
        let convertedWeight: Double = {
            if selection == "lb" {
                return Double(rawWeight / 2.205)
            } else {
                return Double(rawWeight)
            }
        }()

        DispatchQueue.main.async {
            userProfile.currentWeight = convertedWeight
        }

        return VStack {
            Text("What’s your current\nWeight?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(AppColors.text)
                .padding(.bottom, 20)

            VStack(spacing: 60) {
                VStack {
                    ToggleSelector(options: ["kg", "lb"], selected: $selection)
                        .padding(.bottom)

                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text("\(Int(rawWeight))")
                            .font(.largeTitle.bold())
                            .contentTransition(.numericText(value: rawWeight))
                            .animation(.snappy, value: rawWeight)

                        Text(selection)
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }

                    WeightPicker(config: config, value: $value)
                        .frame(height: 80)
                }
            }
            .padding()

            Spacer()
        }
    }
}



