//
//  ContentView.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print("-- \(fontName) ")
            }
        }
    }
    
    var body: some View {
        Text("dd")
    }
}

#Preview {
    ContentView()
}
