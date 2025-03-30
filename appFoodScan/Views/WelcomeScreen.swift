//
//  WelcomeScreen.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @State private var navigateToSignUp = false
    @State private var navigateToSignIn = false
        
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .center, spacing: 42){
                Image("LogoFoodScanGreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 86, height: 86)
                
                VStack(alignment: .center, spacing: 16){
                    Text("Let's Get Started!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(AppColors.text)
                    
                    Text("Let's dive into your account")
                        .foregroundStyle(.gray)
                }
            }.padding(.bottom, 32)
            
            VStack(alignment: .center, spacing: 20){
                SocialLoginButton(text: "Continue with Google", logo: "Google") {print("Google login tapped")}
            
                SocialLoginButton(text: "Continue with Apple", logo: "Apple") {print("Google login tapped")}
           
                SocialLoginButton(text: "Continue with Facebook", logo: "Facebook") {print("Google login tapped")}
           
                SocialLoginButton(text: "Continue with X", logo: "X") {print("Google login tapped")}
            }.padding(.bottom, 32)
            
            VStack(alignment: .center, spacing: 20){
                PrimaryButton(title: "Sign Up") {
                    navigateToSignUp = false
                }
                SecondaryButton(title: "Sign In") {
                    navigateToSignIn = true
                }.navigationDestination(isPresented:$navigateToSignIn) {
                    SignIn()
                }
            }.padding(.bottom, 20)
        }
        
        
    }
}

#Preview {
    WelcomeScreen()
}
