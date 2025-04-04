//
//  WheelPicker.swift
//  appFoodScan
//
//  Created by Carlos López on 30/03/25.
//

import SwiftUI

struct WheelPicker: View {
    var config: Config
    @Binding var value: Int

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let horizontalPadding = size.width / 2

            ScrollView(.horizontal) {
                HStack(spacing: config.spacing) {
                    let totalSteps = config.steps * config.count

                    ForEach(0..<totalSteps, id: \.self) { index in
                        let remainder = index % config.steps

                        Divider()
                            .background(remainder == 0 ? Color.primary : Color.gray)
                            .frame(
                                width: 1,
                                height: remainder == 0 ? 20 : 10,
                                alignment: .center
                            )
                            .frame(maxHeight: 20, alignment: .bottom)
                            .overlay(alignment: .bottom){
                                if remainder == 0 && config.showText{
                                    Text("\(index / config.steps)")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .textScale(.secondary)
                                        .fixedSize()
                                        .foregroundStyle(.gray)
                                        .offset(y: 30)
                                }
                            }
                    }
                }
                .frame(height: size.height)
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: .init(get: {
                let position: Int? = value
                return position
            }, set: { newValue in
                if let newValue {value = newValue}
            }))
            .overlay(alignment: .center, content: {
                Rectangle()
                    .frame(width: 3, height: 40)
                    .padding(.bottom, 25)
                    .foregroundStyle(AppColors.primary)

            })
            .safeAreaPadding(.horizontal, horizontalPadding)
        }
    }
}

struct Config: Equatable {
    var count: Int
    var steps: Int = 10
    var spacing: CGFloat = 5
    var showText: Bool = true
}


#Preview {
    @State var value = 0
    return WheelPicker(config: Config(count: 20), value: $value)
}
