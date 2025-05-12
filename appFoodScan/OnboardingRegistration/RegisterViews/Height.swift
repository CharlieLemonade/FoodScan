//
//  Height.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Height: View {
    @Binding var userProfile: UserProfile
    @State private var config: Config = .init(count: 30)
    @State private var selection = "cm"
    @State private var value: Int = 0

    var body: some View {
        let rawHeight = CGFloat(config.steps) * CGFloat(value)
        let convertedHeight: Double = {
            if selection == "ft" {
                return Double(rawHeight * 30.48)
            } else {
                return Double(rawHeight)
            }
        }()

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
                .padding(.bottom, 90)

            VStack(spacing: 60) {
                VStack {
                    ToggleSelector(options: ["cm", "ft"], selected: $selection)
                        .padding(.bottom)

                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text("\(Int(rawHeight))")
                            .font(.largeTitle.bold())
                            .contentTransition(.numericText(value: rawHeight))
                            .animation(.snappy, value: rawHeight)

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

