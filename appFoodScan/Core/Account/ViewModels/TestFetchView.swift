//
//  TestFetchView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI
import FirebaseAuth

struct TestFetchView: View {
    @State private var profile: UserProfile?
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let profile = profile {
                Text("Nombre: \(profile.name)")
                Text("Género: \(profile.gender)")
                Text("Nacimiento: \(profile.birthday)")
                Text("Altura: \(profile.height, specifier: "%.1f") cm")
                Text("Peso actual: \(profile.currentWeight, specifier: "%.1f") kg")
                Text("Peso meta: \(profile.targetWeight, specifier: "%.1f") kg")
                Text("Actividad: \(profile.activityLevel)")
                Text("Dieta: \(profile.dietType)")
            //    Text("Desayuno: \(profile.breakfastTime)")
           //     Text("Cena: \(profile.dinnerTime)")
                Text("Objetivos: \(profile.goals.joined(separator: ", "))")
            } else if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                Text("Cargando perfil...")
            }
        }
        .padding()
        .task {
            do {
                guard let uid = Auth.auth().currentUser?.uid else {
                    errorMessage = "Usuario no autenticado"
                    return
                }
                profile = try await UserService().fetchUserProfile(for: uid)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}


#Preview {
    TestFetchView()
}
