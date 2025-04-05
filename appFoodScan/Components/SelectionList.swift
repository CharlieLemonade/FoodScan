//
//  SelectionList.swift
//  appFoodScan
//
//  Created by Carlos López on 04/04/25.
//

import SwiftUI

struct Goal: Identifiable, Hashable {
    let id = UUID()
    let icon: String
    let label: String
    var selected: Bool = false
}

struct SelectionList: View {
    @Binding var goals: [Goal]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(goals.indices, id: \.self) { index in
                Button(action: {
                    goals[index].selected.toggle()
                }) {
                    HStack {
                        Text("\(goals[index].icon) \(goals[index].label)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        
                        Spacer()
                        
                        if goals[index].selected {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(width: 360, height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(goals[index].selected ? Color.green : Color.gray.opacity(0.4), lineWidth: 1)
                            .background(goals[index].selected ? Color.green.opacity(0.1) : Color.clear)
                    )
                }
            }
        }
    }
}


struct SelectionList_Previews: PreviewProvider {
    @State static var sampleGoals: [Goal] = [
        Goal(icon: "🔥", label: "Lose Weight"),
        Goal(icon: "💪", label: "Gain Muscle"),
        Goal(icon: "🥗", label: "Improve Nutrition")
    ]
    
    static var previews: some View {
        SelectionList(goals: $sampleGoals)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

