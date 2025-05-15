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
    @State private var navigateToOnboarding = false
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var isLoading = false

    var isFormValid: Bool {
        return isValidEmail(viewModel.email) &&
               isValidPassword(viewModel.password) &&
               agree
    }

    var body: some View {
        NavigationStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 10){
                Text("Join FoodScan Today ✨")
                    .foregroundStyle(AppColors.text)
                    .font(.title2)
                    .fontWeight(.bold)
                
                VStack (alignment: .leading, spacing:4){
                    Text("Create a FoodScan account to track your meals,")
                        .foregroundColor(.gray)
                        .font(.callout)
                    
                    Text("stay active and achieve")
                        .foregroundStyle(.gray)
                        .font(.callout)
                    
                    Text("your health goals")
                        .foregroundStyle(.gray)
                        .font(.callout)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.top, 4)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Email")
                        .fontWeight(.semibold)
                    CustomTextField(icon: "envelope", placeholder: "Email", text: $viewModel.email)
                }
                .padding(.vertical, 8)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .fontWeight(.semibold)
                    CustomTextField(icon: "lock", placeholder: "Password", text: $viewModel.password, isSecure: true)
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal)
            
            HStack(spacing: 3) {
                Toggle(isOn: $agree) {
                    Text("I agree to")
                }
                .toggleStyle(CustomCheckboxToggle())
                
                Button(action: {
                    // Acción para mostrar términos y condiciones
                }) {
                    Text("Terms & Conditions")
                        .foregroundColor(AppColors.primary)
                        .fontWeight(.semibold)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .font(.callout)
            
            HStack(alignment: .center) {
                Text("Already have an account?")
                Button(action: {
                    navigateToSignIn = true
                }) {
                    Text("Sign In")
                        .foregroundColor(AppColors.primary)
                        .fontWeight(.semibold)
                }
            }
            .font(.callout)
            .padding()
            
            HStack {
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 4) - 40, height: 0.5)
                    .foregroundColor(.gray)
                
                Text("or continue with")
                    .font(.callout)
                    .foregroundStyle(.gray)
                
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 4) - 40, height: 0.5)
                    .foregroundColor(.gray)
            }
            .padding()
            
            HStack(spacing: 20) {
                SocialButton(imageName: "Google", action: {})
                SocialButton(imageName: "Apple", action: {})
                SocialButton(imageName: "Facebook", action: {})
                SocialButton(imageName: "X", action: {})
            }
            
            Spacer(minLength: 30)
            
            PrimaryButton(title: "Sign Up", isDisabled: !isFormValid, isLoading: isLoading) {
                isLoading = true
                Task {
                    do {
                        try await viewModel.createUser()
                        navigateToOnboarding = true
                    } catch {
                        alertMessage = "Error creating user: \(error.localizedDescription)"
                        showAlert = true
                    }
                    isLoading = false
                }
            }
            .padding(.bottom, 20)
            .alert("Oops!", isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(alertMessage)
            }
            
            .navigationDestination(isPresented: $navigateToSignIn) {
                SignIn()
            }
            .navigationDestination(isPresented: $navigateToOnboarding) {
                OnboardingRegisterFlowView()
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Validations
    
    private func isValidEmail(_ email: String) -> Bool {
        let pattern = #"^\S+@\S+\.\S+$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}

#Preview {
    SignUp()
}
