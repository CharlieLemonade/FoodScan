//
//  SocialButton.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct SocialButton: View {
    var imageName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
        }.frame(width: 54, height: 54)
        .overlay{
            
            RoundedRectangle (cornerRadius: 16)
                .stroke (lineWidth: 0.5)
                .foregroundStyle(.gray)
        }
    }
}
    
struct SocialButton_Previews: PreviewProvider {
    static var previews: some View {
        @State var sampleText = ""
        return SocialButton(imageName: "Google", action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
