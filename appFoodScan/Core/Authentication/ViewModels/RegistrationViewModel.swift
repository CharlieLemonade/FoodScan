//
//  RegistrationViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import Foundation

class RegsistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws{
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password)
    }
    
    
    
}
