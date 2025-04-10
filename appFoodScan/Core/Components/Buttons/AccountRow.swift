//
//  AccountRow.swift
//  appFoodScan
//
//  Created by Carlos López on 08/04/25.
//

import SwiftUI

struct AccountRow: View {
    let icon: String
    let label: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 24)
            Text(label)
                .fontWeight(.semibold)
                .foregroundStyle(AppColors.text)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

struct AccountRow_Preview: PreviewProvider {
    static var previews: some View {
        AccountRow(icon: "bell", label: "Notification")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
