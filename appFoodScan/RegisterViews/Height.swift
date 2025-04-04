//
//  Height.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Height: View {
    @State private var config: Config = .init(count: 10)
    @State private var currentStep = 4
    private let totalSteps = 11
    @State private var name: String = ""
    @State private var value: Int = 0

    var body: some View {
        let lbs = CGFloat(config.steps) * CGFloat(value)

        OnboardingStepView(
            currentStep: currentStep,
            totalSteps: totalSteps,
            title: "How tall are you?",
            onBack: {},
            onContinue: {},
            content: {
                VStack(spacing: 40) {

                    HStack(alignment: .lastTextBaseline, spacing: 5) {
                        Text(verbatim: "\(Int(lbs))")
                            .font(.largeTitle.bold())
                            .contentTransition(.numericText(value: lbs))
                            .animation(.snappy, value: lbs)

                        Text("cm")
                            .font(.title2)
                            .foregroundStyle(.secondary)
                    }

                    // Picker
                    WheelPicker(config: config, value: $value)
                        .frame(height: 70)
                }
                .padding(.top, 20)
            }
        )
    }
}

#Preview {
    Height()
}
