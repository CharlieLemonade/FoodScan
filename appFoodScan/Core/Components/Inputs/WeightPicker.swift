//
//  WeightPicker.swift
//  appFoodScan
//
//  Created by Carlos López on 14/05/25.
//

import SwiftUI

struct WeightPicker: View {
    var config: WeightPickerConfig = WeightPickerConfig(min: 30, max: 200)
    @Binding var value: Int

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let horizontalPadding = size.width / 2

            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    ForEach(config.min...config.max, id: \.self) { index in
                        Divider()
                            .background(index % 5 == 0 ? Color.primary : Color.gray)
                            .frame(
                                width: 1,
                                height: index % 5 == 0 ? 24 : 12,
                                alignment: .center
                            )
                            .frame(maxHeight: 24, alignment: .bottom)
                            .overlay(alignment: .bottom) {
                                if index % 5 == 0 && config.showText {
                                    Text("\(index)")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .textScale(.secondary)
                                        .fixedSize()
                                        .foregroundStyle(.gray)
                                        .offset(y: 30)
                                }
                            }
                            .id(index)
                    }
                }
                .frame(height: size.height)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: .init(get: {
                value
            }, set: { newValue in
                if let newValue { value = newValue }
            }))
            .overlay(alignment: .center) {
                Rectangle()
                    .frame(width: 3, height: 40)
                    .padding(.bottom, 25)
                    .foregroundStyle(AppColors.primary)
            }
            .safeAreaPadding(.horizontal, horizontalPadding)
        }
    }
}

struct WeightPickerConfig: Equatable {
    var min: Int
    var max: Int
    var spacing: CGFloat = 8
    var showText: Bool = true
}

#Preview {
    @State var weight = 70
    return WeightPicker(value: $weight)
}
