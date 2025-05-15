//
//  TabBaRView.swift
//  appFoodScan
//
//  Created by Carlos López on 06/04/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Home")
                }
                .onAppear{ selectedTab == 0 }
                .tag(0)
           

            Text("Tracker")
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "square.grid.2x2.fill" : "square.grid.2x2")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    
                    Text("Tracker")
                    
                }
                .onAppear{ selectedTab == 1 }
                .tag(1)
            
            BarcodeScannerMockView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Scan")
                }
                .onAppear{ selectedTab == 2 }
                .tag(2)
            
            Text("Insights")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "chart.bar.fill" : "chart.bar")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                    Text("Insights")
                }
                .onAppear{ selectedTab == 3 }
                .tag(3)
            
            AccountView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    Text("Account")
                }
                .onAppear{ selectedTab == 4 }
                .tag(4)
        }
        .tint(AppColors.primary)
    }
}

#Preview {
    TabBarView()
}
