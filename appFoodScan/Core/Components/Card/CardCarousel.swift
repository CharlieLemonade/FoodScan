//
//  CardCarousel.swift
//  appFoodScan
//
//  Created by Carlos López on 14/05/25.
//

import SwiftUI

struct CardCarousel: View {
    let foods: [Food]
    @State private var currentIndex: Int

    init(foods: [Food], initialIndex: Int = 0) {
        self.foods = foods
        self._currentIndex = State(initialValue: initialIndex)
    }

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(foods.indices, id: \.self) { index in
                Card(food: foods[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}



