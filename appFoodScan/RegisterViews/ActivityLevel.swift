//
//  ActivityLevel.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct SelectionActivity: View {
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
        
    }
}


struct ActivityLevel: View {
    var body: some View {
        
        Text("What’s your main goal \nwith FoodScan?")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundStyle(AppColors.text)

        SelectionActivity()
            .padding(.top)
        
        
    }
}


#Preview {
    ActivityLevel()
}
