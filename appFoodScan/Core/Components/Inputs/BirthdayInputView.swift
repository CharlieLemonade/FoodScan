//
//  BirthdayInputView.swift
//  appFoodScan
//
//  Created by Carlos López on 05/04/25.
//

import SwiftUI

struct BirthdayInputView: View {
    @State private var month = ""
    @State private var day = ""
    @State private var year = ""

    var body: some View {
        VStack(spacing: 32) {
            HStack(spacing: 40) {
                VStack {
                    Text("MONTH")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("MM", text: $month)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(width: 80, height: 70)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }

                VStack {
                    Text("DAY")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("DD", text: $day)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(width: 80, height: 70)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }

                VStack {
                    Text("YEAR")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("YYYY", text: $year)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .frame(width: 100, height: 70)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
            }
        }
        .padding()
    }
}

struct BirthdayInputView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdayInputView()
            .previewDevice("iPhone 14 Pro")
    }
}
