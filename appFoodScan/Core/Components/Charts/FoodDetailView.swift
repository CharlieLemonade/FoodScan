//
//  FoodDetailView.swift
//  appFoodScan
//
//  Created by Carlos López on 09/05/25.
//

import SwiftUI

struct FoodDetailView: View {
    @State private var quantity: Int = 1

    var body: some View {
        VStack(spacing: 20) {
            HeaderView(imageName: "kitkat", title: "Kit Kat")

        }
        .padding()
    }
}

#Preview {
    FoodDetailView()
}
