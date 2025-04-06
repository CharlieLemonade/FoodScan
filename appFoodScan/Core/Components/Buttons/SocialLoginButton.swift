//
//  SocialLoginButton.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI


struct SocialLoginButton: View {
    var text: String
    var logo: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                   
        
                
                HStack(alignment: .center){
                    Text(text)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.text)
                        
                }
                
       
            }.frame(width: 360, height: 56)
            .overlay{
                RoundedRectangle (cornerRadius: 32)
                    .stroke (lineWidth: 0.5)
                    .foregroundStyle(.gray)
            }
            
        }
    }
}


struct SocialSLoginButton_preview: PreviewProvider {
    static var previews: some View {
        @State var sampleText = ""
        SocialLoginButton(text: "Continue with Google", logo: "Google") {print("Google login tapped")}
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
