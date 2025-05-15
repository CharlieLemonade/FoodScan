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
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    // Logo y bienvenida
                    VStack(alignment: .center, spacing: 30) {
                        Image("LogoFoodScanGreen")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .center, spacing: 16) {
                            Text("Let's Get Started!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(AppColors.text)
                            
                            Text("Let's dive into your account")
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.top, geometry.size.height * 0.08)

                    // Botones sociales
                    VStack(alignment: .center, spacing: 16) {
                        SocialLoginButton(text: "Continue with Google", logo: "Google") {
                            print("Google login tapped")
                        }
                        SocialLoginButton(text: "Continue with Apple", logo: "Apple") {
                            print("Apple login tapped")
                        }
                        SocialLoginButton(text: "Continue with Facebook", logo: "Facebook") {
                            print("Facebook login tapped")
                        }
                        SocialLoginButton(text: "Continue with X", logo: "X") {
                            print("X login tapped")
                        }
                    }
                    .padding(.top, 32)

                    Spacer()

                    // Botones inferiores
                    VStack(alignment: .center, spacing: 12) {
                        PrimaryButton(title: "Sign Up") {
                            navigateToSignUp = true
                        }
                        SecondaryButton(title: "Sign In") {
                            navigateToSignIn = true
                        }
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
                }
                .padding(.top, 10)
                .padding(.horizontal, 24)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .navigationDestination(isPresented: $navigateToSignIn) {
                    SignIn()
                }
                .navigationDestination(isPresented: $navigateToSignUp) {
                    SignUp()
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}


