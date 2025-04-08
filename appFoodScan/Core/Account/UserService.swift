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
}


