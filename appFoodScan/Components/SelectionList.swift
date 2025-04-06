//
//  SelectionList.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct SelectionListItem: View {
    var icon: String
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(icon)
                    .font(.system(size: 25))
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(AppColors.primary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.white : Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(isSelected ? AppColors.primary : Color.clear, lineWidth: 3)
            )
            .cornerRadius(5)
        }
    }
}

struct SelectionListExampleView: View {
    @State private var selectedOptions: Set<String> = ["Lose Weight", "Gain Muscle", "Improve Nutrition"]

    let options: [(icon: String, title: String)] = [
        ("🔥", "Lose Weight"),
        ("💪", "Gain Muscle"),
        ("⚖️", "Maintain Weight"),
        ("⚡️", "Boost Energy"),
        ("🥗", "Improve Nutrition"),
        ("🎈", "Gain Weight")
    ]

    var body: some View {
        VStack(spacing: 12) {
            ForEach(options, id: \.title) { option in
                SelectionListItem(
                    icon: option.icon,
                    title: option.title,
                    isSelected: selectedOptions.contains(option.title)
                ) {
                    if selectedOptions.contains(option.title) {
                        selectedOptions.remove(option.title)
                    } else {
                        selectedOptions.insert(option.title)
                    }
                }
            }
        }
        .padding()
    }
}

struct SelectionListItem_Previews: PreviewProvider {
    static var previews: some View {
        SelectionListExampleView()
            .previewLayout(.sizeThatFits)
    }
}




