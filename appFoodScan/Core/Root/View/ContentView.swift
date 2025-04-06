//
//  ContentView.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @State private var showSplash = true
    
    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
            } else {
                if viewModel.userSession != nil {
                    OnBoarding()
                } else {
                    SignIn()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
