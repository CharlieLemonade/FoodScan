//
//  DateFormatted.swift
//  appFoodScan
//
//  Created by Carlos López on 08/04/25.
//

import SwiftUI


struct DateFormattedView: View {
    var body: some View {
        Text(formattedDate(from: Date()))
            .font(.headline)
    }
    
    func formattedDate(from date: Date) -> String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d"
            let datePart = formatter.string(from: date)
            return "Today, \(datePart)"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE, MMM d"
            return formatter.string(from: date)
        }
    }
}

struct DateFormatesdView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormattedView()
            .previewLayout(.sizeThatFits)
    }
}
