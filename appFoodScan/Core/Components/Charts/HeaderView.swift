//
//  HeaderView.swift
//  appFoodScan
//
//  Created by Carlos López on 09/05/25.
//

import SwiftUI

struct HeaderView: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Text(title)
                .font(.title2).bold()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(imageName: "kitkat", title: "Kit Kat")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

