//
//  OnBoarding.swift
//  AppFoodScan
//
//  Created by Carlos López on 15/03/25.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        
        ZStack{
            Color(AppColors.primary)
                .ignoresSafeArea(.all)
            
            
            VStack{
                Spacer()
                CurvedSideRectangle()
                    .frame(height: 400)
                    .foregroundStyle(.white)
                    .overlay{
                        VStack(spacing: 8){
                            Text("FoodScan")
                                .font(.custom("UrbanistRoman-Bold", size: 32))
                                .fontWeight(.bold)
                            Text("Tracking Made Easy")
                                .font(.custom("Urbanist-Regular", size: 28))
                                .fontWeight(.bold)
                            
                            VStack(spacing: 6){
                                Text("Log your meals, track activies, steps, weight")
                                    .font(.custom("UrbanistRoman-Medium", size: 16))
                                
                                Text("BMI, and monitor hydration with tailored")
                                    .font(.custom("UrbanistRoman-Medium", size: 16))
                                Text("insights just for you.")
                                    .font(.custom("UrbanistRoman-Medium", size: 16))
                            }.foregroundStyle(AppColors.gray)
                            
                        }
                        
                        
                    }
                
            }
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    OnBoarding()
}
