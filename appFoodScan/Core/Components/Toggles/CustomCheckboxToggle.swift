//
//  CheckboxToggle.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct CustomCheckboxToggle: ToggleStyle {
    var activeColor: Color = AppColors.primary
    var inactiveColor: Color = AppColors.primary
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? activeColor : inactiveColor)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(AppColors.text)
        }
    }
}

struct CustomCheckboxToggleStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("I agree to the terms", isOn: .constant(false))
            .toggleStyle(CustomCheckboxToggle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
