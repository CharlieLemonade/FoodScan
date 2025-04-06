//
//  GenderSelection.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct GenderSelection: View {
    enum Gender: String {
        case male, female, none
    }

    @State private var selectedGender: Gender? = nil

    var body: some View {
        
        Text("What's your gender?")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(AppColors.text)
            .padding(.bottom, 90)
        
        
        
        StepGenderView()
        
        Spacer()
            
            
        
    }


}

#Preview {
    GenderSelection()
}
