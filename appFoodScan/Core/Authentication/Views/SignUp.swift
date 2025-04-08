//
//  SignUp.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct SignUp: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @State private var agree = false
    @State private var navigateToSignIn = false
    
    var body: some View {
        
        NavigationStack{
            Spacer()
            
            VStack(alignment: .leading, spacing: 10){
                Text("Join FoodScan Today ✨")
                    .foregroundStyle(AppColors.text)
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack (alignment: .leading, spacing:6){
                    Text("Create a FoodScan account to track yout meals,")
                        .foregroundColor(.gray)
                    
                    Text("stay active and achieve your health goals")
                        .foregroundStyle(.gray)
                    
                }
                
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
            
            HStack(spacing: 3){
                Toggle("I agree to", isOn: .constant(false))
                    .toggleStyle(CustomCheckboxToggle())
                Button(action: {
                   //Action Terms & Conditions
                }) {
                    HStack(spacing: 1){
                        Text("Terms & Conditions")
                            .foregroundColor(
                                AppColors.primary)
                            .fontWeight(.semibold)
                        Text(".")
                            
                    }
                    
                    
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .font(.callout)
            
            HStack(alignment: .center)
            {
                Text("Already have an account?")
                    .fontWeight(.regular)
                Button(action: {
                    navigateToSignIn = true
                }) {
                    Text("Sign In")
                        .foregroundColor(AppColors.primary)
                        .fontWeight(.semibold)
                }
            }.font(.callout)
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
            
            PrimaryButton(title: "Sign Up") {
                Task{ do {
                    try await viewModel.createUser()
                } catch {
                    // Manejo del error, por ejemplo:
                    print("Error al crear usuario: \(error.localizedDescription)")
                } }
            }.padding(.bottom, 20)
               
                
                
                .navigationDestination(isPresented:$navigateToSignIn) {
                    SignIn()
                }
            
            
        }.navigationBarHidden(true)
        
        
    }
    
    
}

#Preview {
    SignUp()
}
 
