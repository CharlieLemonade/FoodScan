//
//  ScannerCornerOverlay.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct ScannerCornerOverlay: View {
    var size: CGSize = CGSize(width: 300, height: 150)
    var cornerLength: CGFloat = 20
    var cornerThickness: CGFloat = 3
    var cornerColor: Color = AppColors.primary

    var body: some View {
        ZStack {
            // Top Left
            VStack {
                HStack {
                    corner
                        .frame(width: cornerLength, height: cornerThickness)
                    Spacer()
                }
                HStack {
                    corner
                        .frame(width: cornerThickness, height: cornerLength)
                    Spacer()
                }
                Spacer()
            }

            // Top Right
            VStack {
                HStack {
                    Spacer()
                    corner
                        .frame(width: cornerLength, height: cornerThickness)
                }
                HStack {
                    Spacer()
                    corner
                        .frame(width: cornerThickness, height: cornerLength)
                }
                Spacer()
            }

           
            VStack {
                Spacer()
                HStack {
                    corner
                        .frame(width: cornerThickness, height: cornerLength)
                    Spacer()
                }
                HStack {
                    corner
                        .frame(width: cornerLength, height: cornerThickness)
                    Spacer()
                }
            }

            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    corner
                        .frame(width: cornerThickness, height: cornerLength)
                }
                HStack {
                    Spacer()
                    corner
                        .frame(width: cornerLength, height: cornerThickness)
                }
            }
        }
        .frame(width: size.width, height: size.height)
    }

    var corner: some View {
        Rectangle()
            .foregroundColor(cornerColor)
            .cornerRadius(2)
    }
}


#Preview {
    ScannerCornerOverlay()
}
