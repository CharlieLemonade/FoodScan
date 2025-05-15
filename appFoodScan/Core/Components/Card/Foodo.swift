//
//  FoodListView.swift
//  appFoodScan
//
//  Created by Carlos López on 14/05/25.
//

import SwiftUI

struct Foodo: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(MOCK_FOOD.indices, id: \.self) { index in
                    NavigationLink(destination: CardCarousel(foods: MOCK_FOOD, initialIndex: index)) {
                        Text(MOCK_FOOD[index].nombre)
                    }
                }
            }
            .navigationTitle("Food List")
        }
    }
}

#Preview {
    Foodo()
}
