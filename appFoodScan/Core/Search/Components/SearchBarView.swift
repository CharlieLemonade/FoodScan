//
//  SearchBarView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onRefresh: () -> Void
    var onScanTap: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search", text: $searchText)
                    .foregroundColor(.primary)

                if let onScanTap = onScanTap {
                    Button(action: onScanTap) {
                        Image(systemName: "barcode.viewfinder")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(12)

            Button(action: onRefresh) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.gray)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
            }
        }
    }
}

struct StatefulPreviewWrapper<Value>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> AnyView

    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> some View) {
        self._value = State(initialValue: initialValue)
        self.content = { binding in AnyView(content(binding)) }
    }

    var body: some View {
        content($value)
    }
}



#Preview {
    StatefulPreviewWrapper("") { searchText in
        SearchBarView(
            searchText: searchText,
            onRefresh: {
                print("Refrescar")
            },
            onScanTap: {
                print("Escanear código")
            }
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}


