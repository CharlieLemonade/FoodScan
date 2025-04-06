//
//  AccountSetupStepName.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct CurrentWeight: View {
    @State private var config: Config = .init(count: 30)
    @State private var selection = "kg"
    @State private var name: String = ""
    @State private var value: Int = 0
    
    var body: some View {
        let lbs = CGFloat(config.steps) * CGFloat(value)
        
        Text("What’s your current \nWeight?")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(AppColors.text)
            .padding(.bottom, 90)
        
        VStack(spacing:60) {
            
            VStack {
                ToggleSelector(options: ["kg", "lb"], selected: $selection)
                    .padding(.bottom)
                
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    
                    Text(verbatim: "\(Int(lbs))")
                        .font(.largeTitle.bold())
                        .contentTransition(.numericText(value: lbs))
                        .animation(.snappy, value: lbs)
                    
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

#Preview {
    CurrentWeight()
}

