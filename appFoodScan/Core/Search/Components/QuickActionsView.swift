//
//  QuickActionsView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct QuickActionsView: View {
    var onQuickLog: () -> Void
    var onCreateFood: () -> Void

    var body: some View {
        HStack {
            Button(action: onQuickLog) {
                Label("Quick Log", systemImage: "bolt.fill")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }

            Button(action: onCreateFood) {
                Label("Create Food", systemImage: "plus.circle")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
    }
}


#Preview {
    QuickActionsView(
        onQuickLog: { print("Quick Log tapped") },
        onCreateFood: { print("Create Food tapped") }
    )
    .padding()
    .previewLayout(.sizeThatFits)
}
