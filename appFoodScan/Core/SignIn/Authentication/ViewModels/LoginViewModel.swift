//
//  LoginViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 07/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws{
        try await AuthService.shared.login(
            withEmail: email,
            password: password)
    }
    
    
    
}
