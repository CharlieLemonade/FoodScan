//
//  CustomTextField.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var backgroundColor: Color = Color(.systemGray6)
    var cornerRadius: CGFloat = 10
    var borderColor: Color = Color.gray.opacity(0.5)
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
            }
        }
        .padding()
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: 1)
        )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        @State var sampleText = ""
        return CustomTextField(icon: "person", placeholder: "Username", text: $sampleText)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
