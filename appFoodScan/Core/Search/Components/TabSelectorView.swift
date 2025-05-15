//
//  TabSelectorView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct TabSelectorView: View {
    let tabs: [String]
    @Binding var selectedTab: String

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    Text(tab)
                        .font(.caption2)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(selectedTab == tab ? AppColors.primary : Color.clear)
                        .foregroundColor(AppColors.text)
                        .fontWeight(.semibold)
                }
            }
        }
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    struct TabSelectorPreviewWrapper: View {
        @State private var selectedTab = "Recent"
        let tabs = ["Recent", "Favorites", "Personal"]

        var body: some View {
            TabSelectorView(tabs: tabs, selectedTab: $selectedTab)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }

    return TabSelectorPreviewWrapper()
}
