//
//  CaloriePlanView.swift
//  appFoodScan
//
//  Created by Carlos López on 11/05/25.
//

import SwiftUI

struct CaloriePlanView: View {
    @State private var navigateToHome = false

    let totalCalories = 2560
    let macros: [(label: String, percent: Double, color: Color)] = [
        ("Carbs", 0.35, .red),
        ("Protein", 0.20, .orange),
        ("Fat", 0.45, .blue)
    ]
    
    var angles: [Double] {
        var start = -90.0
        return macros.map { macro in
            defer { start += 360 * macro.percent }
            return start
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                // Cerrar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                    .padding()
                    Spacer()
                }

                // Título
                Text("Your personalized calorie plan is ready!")
                    .font(.system(size: 26, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 30)

                // Círculo principal
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.15), lineWidth: 30)
                        .frame(width: 220, height: 220)

                    ForEach(Array(macros.enumerated()), id: \.offset) { index, macro in
                        Circle()
                            .trim(from: 0, to: CGFloat(macro.percent))
                            .stroke(macro.color, style: StrokeStyle(lineWidth: 30, lineCap: .round))
                            .rotationEffect(.degrees(angles[index]))
                            .frame(width: 220, height: 220)
                    }

                    VStack {
                        Text("\(totalCalories)")
                            .font(.system(size: 40, weight: .bold))
                        Text("kcal")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }

                    // Etiquetas flotantes
                    GeometryReader { geo in
                        let radius: CGFloat = 120
                        let center = CGPoint(x: geo.size.width / 2, y: geo.size.height / 2)
                        ForEach(Array(macros.enumerated()), id: \.offset) { index, macro in
                            let angle = angles[index] + (360 * macro.percent) / 2
                            let rad = angle * .pi / 180
                            let point = CGPoint(
                                x: center.x + radius * cos(rad),
                                y: center.y + radius * sin(rad)
                            )
                            Text("\(Int(macro.percent * 100))%")
                                .font(.system(size: 14, weight: .semibold))
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 3)
                                .position(point)
                        }
                    }
                    .frame(width: 220, height: 220)
                }

                // Leyenda
                HStack(spacing: 30) {
                    ForEach(macros, id: \.label) { macro in
                        HStack(spacing: 6) {
                            Circle()
                                .fill(macro.color)
                                .frame(width: 10, height: 10)
                            Text(macro.label)
                                .font(.system(size: 16))
                        }
                    }
                }.padding(.top, 40)

                Spacer()

                // Botón con NavigationLink
                NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                    EmptyView()
                }

                PrimaryButton(title: "Start your Plan Now") {
                    navigateToHome = true
                }
                .padding(.bottom)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CaloriePlanView()
}




