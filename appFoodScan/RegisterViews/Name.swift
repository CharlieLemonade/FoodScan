//
//  Name.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Name: View {
    @State private var currentStep = 1
    private let totalSteps = 11
    @State private var name: String = ""
    @State private var value: Int = 0
    
    var body: some View {
        
        Text("What’s your name?")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(AppColors.text)
            .padding(.bottom, 90)
        
        
        
        TextField("Andrew", text: .constant(""))
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

#Preview {
    Name()
}
