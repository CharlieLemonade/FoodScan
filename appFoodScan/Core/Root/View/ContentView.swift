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
        ZStack {
            if showSplash {
                SplashScreen()
                    .transition(.opacity.combined(with: .scale))
            } else {
                if viewModel.userSession != nil {
                    TabBarView()
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                } else {
                    WelcomeScreen()
                        .transition(.move(edge: .bottom)
                            .combined(with: .opacity))
                }
            }
        }
        .animation(.easeInOut(duration: 0.5), value: showSplash) // animación global
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

