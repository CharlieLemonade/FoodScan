//
//  SignIn.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//

import SwiftUI

struct SignIn: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    
    var body: some View {

        VStack(alignment: .leading, spacing: 8){
            Text("Welcome Back! 👋")
                .foregroundStyle(AppColors.text)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Sign in to continue your journey towards a healthier you.")
                .foregroundColor(.gray)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.top)
        
        
        
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Email")
                    .fontWeight(.semibold)
                
                CustomTextField(icon: "envelope", placeholder: "Email", text: $email)
            }.padding(.vertical, 8)
            
            
            Text("Password")
                .fontWeight(.semibold)
            CustomTextField(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
            
        }.padding()
        
        HStack {
            Toggle(isOn: $rememberMe) {
                Text("Remember me")
                    .font(.callout)
            }
            .toggleStyle(CheckboxToggleStyle())
            
            Spacer()
            
            Button(action: {
                // Acción "Forgot Password"
            }) {
                Text("Forgot Password?")
                    .font(.callout)     .foregroundColor(
                        AppColors.primary)
                    .fontWeight(.semibold)
                
                
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
        HStack(alignment: .center)
        {
            Text("Don't have an account?")
                .fontWeight(.regular)
            Button(action: {
                // Acción de Sign Up
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
        
        
        Button {
            print ("Log in")
        } label: {
            Text ("Log in")
                .foregroundStyle(AppColors.text)
                .font (.subheadline)
                .fontWeight (.semibold)
                .frame(width: 360, height: 48)
                .background(AppColors.primary)
                .clipShape (RoundedRectangle(cornerRadius: 16))
        } .padding(.top, 76)
       
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .foregroundColor(configuration.isOn ? .green : AppColors.primary)
                .onTapGesture { configuration.isOn.toggle() }

            configuration.label
        }
    }
}


#Preview {
    SignIn()
}
