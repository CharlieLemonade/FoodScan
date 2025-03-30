//
//  SplashScreen.swift
//  appFoodScan
//
//  Created by Carlos López on 29/03/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false

    var body: some View {
        
            if isActive {
                WelcomeScreen()
            } else {
                ZStack {
                    Color(AppColors.primary)
                        .ignoresSafeArea()
                        
                        VStack {
                            Spacer()
                            
                            VStack(alignment: .center, spacing: 52){
                                Image("LogoFoodScanSecondary")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 128, height: 128)

                                Text("FoodScan")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(AppColors.text)
                            }
                            

                            Spacer()

                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                                .scaleEffect(1.5)
                                .padding(.bottom, 50)
                        }
                        .padding()
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
                }
        }
        
        
}

#Preview {
    SplashScreen()
}
