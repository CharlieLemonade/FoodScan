//
//  MicronutrientList.swift
//  appFoodScan
//
//  Created by Carlos López on 09/05/25.
//

import SwiftUI

struct MicronutrientList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Cholesterol: 5 mg (2%)")
            Text("Sodium: 21 mg (1%)")
            Divider()
            Text("Calcium: 40 mg (3%)")
            Text("Iron: 1 mg (6%)")
            Text("Potassium: 88 mg (3%)")
        }
        .font(.footnote)
        .foregroundColor(.secondary)
    }
}

struct MicronutrientList_Previews: PreviewProvider {
    static var previews: some View {
        MicronutrientList()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

