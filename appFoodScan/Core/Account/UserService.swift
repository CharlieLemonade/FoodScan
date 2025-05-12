//
//  UserService.swift
//  appFoodScan
//
//  Created by Carlos López on 07/04/25.
//

import Foundation
import FirebaseFirestore


class UserService {
    private let db = Firestore.firestore()

    func saveUserProfile(_ profile: UserProfile, for uid: String) async throws {
        let data = try Firestore.Encoder().encode(profile)
        try await db.collection("users").document(uid).setData(data)
        print("DEBUG: User profile saved for \(uid)")
    }
    
    func fetchUserProfile(for uid: String) async throws -> UserProfile {
        let doc = try await db.collection("users").document(uid).getDocument()
        guard let data = doc.data() else {
            throw NSError(domain: "Firestore", code: 404, userInfo: [NSLocalizedDescriptionKey: "Perfil no encontrado"])
        }

        return UserProfile(
            name: data["name"] as? String ?? "",
            gender: data["gender"] as? String ?? "",
            birthday: data["birthday"] as? String ?? "",
            height: data["height"] as? Double ?? 0,
            currentWeight: data["currentWeight"] as? Double ?? 0,
            targetWeight: data["targetWeight"] as? Double ?? 0,
            goals: data["goals"] as? [String] ?? [],
            activityLevel: data["activityLevel"] as? String ?? "",
            dietType: data["dietType"] as? String ?? ""
      //      breakfastTime: data["breakfastTime"] as? String ?? "",
          //  dinnerTime: data["dinnerTime"] as? String ?? ""
        )
    }

}


