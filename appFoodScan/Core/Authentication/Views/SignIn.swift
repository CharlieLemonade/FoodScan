//
//  SignIn.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//

import SwiftUI

struct SignIn: View {
    @StateObject var viewModel = LoginViewModel()
    
    @State private var rememberMe = false
    @State private var navigateToSignUp = false
    
    var body: some View {
        
        NavigationStack{
            Spacer()
            
           
            VStack(alignment: .leading, spacing: 10){
                Text("Welcome Back! 👋")
                    .foregroundStyle(AppColors.text)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack (alignment: .leading, spacing:6){
                    Text("Sign in to continue your journey towards a ")
                        
                    
                    Text("towards a healthier you.")
                        
                    
                }.foregroundStyle(.gray)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Email")
                        .fontWeight(.semibold)
                    
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $viewModel.email)
                }.padding(.vertical, 8)
                
                
                VStack(alignment: .leading){
                    Text("Password")
                        .fontWeight(.semibold)
                    
                    CustomTextField(icon: "lock", placeholder: "Password", text: $viewModel.password, isSecure: true)
                }.padding(.vertical, 8)
                
            }.padding(.horizontal)

            HStack {
                Toggle("Remember me", isOn: $rememberMe)
                    .toggleStyle(CustomCheckboxToggle())

                Spacer()
                
                Button(action: {
                    // Acción "Forgot Password"
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(
                            AppColors.primary)
                        .fontWeight(.semibold)
                    
                    
                }
            }.font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            HStack(alignment: .center)
            {
                Text("Don't have an account?")
                    .fontWeight(.regular)
                Button(action: {
                    navigateToSignUp = true
                }) {
                    Text("Sign up")
                        .foregroundColor(AppColors.primary)
                        .fontWeight(.semibold)
                }
            } .font(.callout)
                .padding()
            
            HStack{
                Rectangle()
                    .frame(width:
                            (UIScreen.main.bounds.width / 4) - 40, height: 0.5)
                    .foregroundColor (.gray)
                
                Text ("or continue with")
                    .font(.callout)
                    .fontWeight (.regular)
                    .foregroundStyle(.gray)
                
                Rectangle()
                    .frame(width:
                            (UIScreen.main.bounds.width / 4) - 40, height: 0.5)
                    .foregroundColor (.gray)
            }
            .padding()
            
            HStack(spacing: 40) {
                SocialButton(imageName: "Google", action: {})
                SocialButton(imageName: "Apple", action: {})
                SocialButton(imageName: "Facebook", action: {})
                SocialButton(imageName: "X", action: {})
            }
            
            Spacer()
            
            
            PrimaryButton(title: "Log in") {
                Task{try await viewModel.login()}
            }       .padding(.bottom, 20)
                    .navigationDestination(isPresented:$navigateToSignUp) {
                SignUp ()
                }
        } .navigationBarHidden(true)

        
       
    }
}

#Preview {
    SignIn()
}
