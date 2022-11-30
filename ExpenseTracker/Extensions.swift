//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Girish Potnuru on 22/11/22.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let sytemBackground = Color(uiColor: .systemBackground)
}


extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
         print("Initialising date format")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
      guard  let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        return parsedDate
    }
}
