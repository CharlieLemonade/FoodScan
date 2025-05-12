//
//  AccountSetupStepName.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct CurrentWeight: View {
    @Binding var userProfile: UserProfile
    @State private var config: Config = .init(count: 30)
    @State private var selection = "kg"
    @State private var value: Int = 0

    var body: some View {
        let rawWeight = CGFloat(config.steps) * CGFloat(value)
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
                .padding(.bottom, 90)

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

                    WheelPicker(config: config, value: $value)
                        .frame(height: 70)
                }
            }
            .padding()

            Spacer()
        }
    }
}


