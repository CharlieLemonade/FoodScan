//
//  HomeHeader.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack {
            Image("LogoFoodScanSecondary")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
            
            Spacer()
            
            Text("FoodScan")
                .font(.title3)
                .bold()
            
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
        }
        .padding(.horizontal)
    }
}

struct HomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeader()
            .previewLayout(.sizeThatFits)
    }
}
