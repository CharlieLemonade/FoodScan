//
//  AuthService.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: Created User \(result.user.uid)")
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created User \(result.user.uid)")
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() //Sign Out on backend
        self.userSession = nil // Removes locally
    }
    

    func createDefaultUserProfile() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        let defaultProfile = UserProfile(
            name: "Carlos",
            gender: "Male",
            birthday: "", 
            height: 175,
            currentWeight: 75,
            targetWeight: 70,
            goals: ["Improve Nutrition"],
            activityLevel: "Moderately Active",
            dietType: "Balanced Diet"
            //breakfastTime: "",
       //     dinnerTime: ""
          //  caloriePlan: CaloriePlan(totalCalories: 2200, carbsPercentage: 40, proteinPercentage: 30, fatPercentage: 30)
        )

        try await UserService().saveUserProfile(defaultProfile, for: uid)
    }

    
    
}
