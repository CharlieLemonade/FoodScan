//
//  SwiftUIView.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct ToggleSelector: View {
    var options: [String]
    @Binding var selected: String

    var body: some View {
        HStack(spacing: 16) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selected = option
                    }
                }) {
                    Text(option)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(selected == option ? AppColors.text : .primary)
                        .frame(width: 54, height: 32)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(selected == option ? AppColors.primary : Color(.systemGray6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(lineWidth: 0.5)
                                .foregroundColor(.gray.opacity(0.4))
                        )
                }
                .buttonStyle(.plain)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: selected)
    }
}



struct ToggleSelector_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var selection = "kg"

        var body: some View {
            ToggleSelector(options: ["kg", "lb"], selected: $selection)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
