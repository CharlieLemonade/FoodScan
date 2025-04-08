//
//  RegistrationViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import Foundation
import FirebaseAuth

@MainActor
class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        //Crear usuario con FirebaseAuth
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password
        )
        
        // Paso 2: Obtener UID del usuario recién registrado
        guard let uid = AuthService.shared.userSession?.uid else {
            throw NSError(domain: "Auth", code: 401, userInfo: [NSLocalizedDescriptionKey: "No authenticated user found"])
        }
        
        //Crear un perfil básico (no onboarding)
        let defaultProfile = UserProfile(
            name: "Nuevo Usuario",
            gender: "Prefer not to say",
            birthday: "12-31-01",
            height: 170,
            currentWeight: 70,
            targetWeight: 65,
            goals: ["Improve Nutrition"],
            activityLevel: "Lightly Active",
            dietType: "Balanced Diet",
            breakfastTime: "",
            dinnerTime: "",
            caloriePlan: CaloriePlan(
                totalCalories: 2200,
                carbsPercentage: 40,
                proteinPercentage: 30,
                fatPercentage: 30
            )
        )
        
        //Guardar Informacion de Perfil
        try await UserService().saveUserProfile(defaultProfile, for: uid)
        
        print("DEBUG: Usuario registrado y perfil guardado....")
    }
}
