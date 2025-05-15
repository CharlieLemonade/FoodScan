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
                    .frame(width: 16, height: 16)
                   
        
                
                HStack(alignment: .center){
                    Text(text)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.text)
                        
                }
                
       
            }.frame(width: 272, height: 48)
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
