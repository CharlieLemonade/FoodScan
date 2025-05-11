//
//  FoodViewModel.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import Foundation

class FoodViewModel: ObservableObject {
    @Published var food: Food?
    @Published var errorMessage: String?

    private let baseURL = "http://150.136.93.252:3000"

    func buscarPorCodigo(_ codigo: String) {
        guard let url = URL(string: "\(baseURL)/buscar-barcode?codigo=\(codigo)") else {
            self.errorMessage = "URL inválida"
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let food = try JSONDecoder().decode(Food.self, from: data)
                        self.food = food
                        self.errorMessage = nil
                    } catch {
                        self.errorMessage = "Error al parsear JSON: \(error.localizedDescription)"
                    }
                } else if let error = error {
                    self.errorMessage = "Error en la petición: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
