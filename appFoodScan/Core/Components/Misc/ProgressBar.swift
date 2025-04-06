//
//  ProgressBar.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

/*import SwiftUI

struct ProgressBar: View {
    @Binding var currentStep: Int
    let totalStep: Int

    var progress: CGFloat {
        totalStep > 0 ? CGFloat(currentStep) / CGFloat(totalStep) : 0
    }

    var body: some View {
        HStack {
            Image(systemName: "arrow.triangle.2.circlepath")
                .foregroundStyle(AppColors.text)
                .padding()
            
            
            ZStack(alignment: .leading) {
 
                Rectangle()
                    .fill(AppColors.backgroundBar)
                    .frame(height: 15)
                    
                
                Rectangle()
                    .fill(AppColors.primary)
                    .frame(width: progress * 300, height: 20)
                    .animation(.easeInOut(duration: 0.3), value: currentStep)
            }
            .clipShape(Capsule())

           
            Text(currentStep >= totalStep ? "Completed" : "\(currentStep)/\(totalStep)")
                .padding()
                .font(.callout)
                .fontWeight(.medium)

        }
        .padding()
    }
}


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(currentStep: .constant(5), totalStep: 10)
            .previewLayout(.sizeThatFits)
    }
}*/

import SwiftUI

struct ProgressBar: View {
    @Binding var currentStep: Int
    let totalStep: Int
    var onBack: (() -> Void)? = nil

    private var progress: CGFloat {
        totalStep > 0 ? CGFloat(currentStep) / CGFloat(totalStep) : 0
    }

    var body: some View {
        HStack {
            // Botón de retroceso
            Button(action: {
                onBack?()
            }) {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.leading)
            }

            // Barra de progreso
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(AppColors.backgroundBar)
                    .frame(height: 10)

                GeometryReader { geometry in
                    Capsule()
                        .fill(AppColors.primary)
                        .frame(width: geometry.size.width * progress, height: 10)
                        .animation(.easeInOut(duration: 0.3), value: currentStep)
                }
            }
            .frame(height: 10)
            .padding(.horizontal, 8)

            // Texto de progreso
            Text("\(currentStep)/\(totalStep)")
                .font(.callout)
                .fontWeight(.medium)
                .foregroundColor(AppColors.text)
                .padding(.trailing)
        }
        .padding(.vertical)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(currentStep: .constant(1), totalStep: 11)
            .previewLayout(.sizeThatFits)
    }
}


