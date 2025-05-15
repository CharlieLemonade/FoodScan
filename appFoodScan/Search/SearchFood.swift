//
//  SearchFood.swift
//  appFoodScan
//
//  Created by Carlos López on 10/05/25.
//

import Foundation

struct Food: Codable, Equatable {
    var id: String?
    let nombre: String
    let porcion: String
    let carbs: Double
    let calories: Double
    let protein: Double
    let fat: Double
    let cholesterol: Double
    let sodium: Double
    let calcium: Double
    let iron: Double
    let potassium: Double
    var emoji: String?

    init(
        nombre: String,
        emoji: String? = nil,
        porcion: String,
        carbs: Double,
        calories: Double,
        protein: Double,
        fat: Double,
        cholesterol: Double,
        sodium: Double,
        calcium: Double,
        iron: Double,
        potassium: Double
    ) {
        self.id = UUID().uuidString
        self.nombre = nombre
        self.emoji = emoji
        self.porcion = porcion
        self.carbs = carbs
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.cholesterol = cholesterol
        self.sodium = sodium
        self.calcium = calcium
        self.iron = iron
        self.potassium = potassium
    }

    enum CodingKeys: String, CodingKey {
        case nombre, porcion, carbs, calories, protein, fat, cholesterol, sodium, calcium, iron, potassium
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nombre = try container.decode(String.self, forKey: .nombre)
        porcion = try container.decode(String.self, forKey: .porcion)
        carbs = Double(try container.decode(String.self, forKey: .carbs)) ?? 0
        calories = Double(try container.decode(String.self, forKey: .calories)) ?? 0
        protein = Double(try container.decode(String.self, forKey: .protein)) ?? 0
        fat = Double(try container.decode(String.self, forKey: .fat)) ?? 0
        cholesterol = Double(try container.decode(String.self, forKey: .cholesterol)) ?? 0
        sodium = Double(try container.decode(String.self, forKey: .sodium)) ?? 0
        calcium = Double(try container.decode(String.self, forKey: .calcium)) ?? 0
        iron = Double(try container.decode(String.self, forKey: .iron)) ?? 0
        potassium = Double(try container.decode(String.self, forKey: .potassium)) ?? 0
        emoji = nil
        id = UUID().uuidString
    }
}

let MOCK_FOOD: [Food] = [
    Food(
        nombre: "Manzana",
        emoji: "🍎",
        porcion: "100g",
        carbs: 14.0,
        calories: 52.0,
        protein: 0.3,
        fat: 0.2,
        cholesterol: 0.0,
        sodium: 1.0,
        calcium: 6.0,
        iron: 0.1,
        potassium: 107.0
    ),
    Food(
        nombre: "Pechuga de pollo",
        porcion: "100g",
        carbs: 0.0,
        calories: 165.0,
        protein: 31.0,
        fat: 3.6,
        cholesterol: 85.0,
        sodium: 74.0,
        calcium: 11.0,
        iron: 1.0,
        potassium: 256.0
    ),
    Food(
        nombre: "Arroz integral cocido",
        porcion: "100g",
        carbs: 25.6,
        calories: 123.0,
        protein: 2.7,
        fat: 1.0,
        cholesterol: 0.0,
        sodium: 4.0,
        calcium: 10.0,
        iron: 0.4,
        potassium: 43.0
    ),
    Food(
        nombre: "Huevos revueltos",
        porcion: "2 huevos",
        carbs: 1.0,
        calories: 140.0,
        protein: 12.0,
        fat: 10.0,
        cholesterol: 370.0,
        sodium: 120.0,
        calcium: 50.0,
        iron: 1.2,
        potassium: 126.0
    ),
    Food(
        nombre: "Yogur natural",
        porcion: "125g",
        carbs: 5.0,
        calories: 75.0,
        protein: 6.5,
        fat: 3.0,
        cholesterol: 15.0,
        sodium: 50.0,
        calcium: 150.0,
        iron: 0.1,
        potassium: 200.0
    )
]



