//
//  Birthday.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct Birthday: View {
    var body: some View {
        
        Text("When's your birthday?")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(AppColors.text)
            .padding(.bottom, 90)
        
        
        BirthdayInputView()
        
        
        Spacer()
    }
}

#Preview {
    Birthday()
}
