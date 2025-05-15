//
//  CaloriePlanService.swift
//  appFoodScan
//
//  Created by Carlos López on 12/05/25.
//

import Foundation

// MARK: - Modelo de respuesta del backend


// MARK: - Solo los campos que espera el backend
private struct CalorieRequest: Codable {
    let gender: String
    let birthday: String
    let height: Double
    let currentWeight: Double
    let activityLevel: String
}

// MARK: - Conversión desde UserProfile
private extension UserProfile {
    var asCalorieRequest: CalorieRequest {
        CalorieRequest(
            gender: gender,
            birthday: birthday,
            height: height,
            currentWeight: currentWeight,
            activityLevel: activityLevel
        )
    }
}

// MARK: - Servicio para obtener el plan calórico
struct CaloriePlanService {
    static func fetch(for profile: UserProfile, completion: @escaping (Result<CaloriePlan, Error>) -> Void) {
        guard let url = URL(string: "http://150.136.93.252:3001/api/calorie-plan") else {
            print("❌ URL inválida")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload = profile.asCalorieRequest

        do {
            let jsonData = try JSONEncoder().encode(payload)
            request.httpBody = jsonData

            // 🔍 Debug: imprimir JSON enviado
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("📤 JSON enviado al backend:")
                print(jsonString)
            }

        } catch {
            print("❌ Error al codificar JSON: \(error)")
            completion(.failure(error))
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            // 🧵 Debug: error de red
            if let error = error {
                print("❌ Error de red: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            // 🔍 Debug: ver respuesta cruda
            if let httpResponse = response as? HTTPURLResponse {
                print("📬 Código de respuesta: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("❌ No se recibió data del backend")
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }

            // 🧵 Debug: ver cuerpo de la respuesta
            if let responseString = String(data: data, encoding: .utf8) {
                print("📥 Respuesta cruda del backend:")
                print(responseString)
            }

            do {
                let plan = try JSONDecoder().decode(CaloriePlan.self, from: data)
                print("✅ Plan calórico decodificado correctamente")
                completion(.success(plan))
            } catch {
                print("❌ Error al decodificar CaloriePlan: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}

