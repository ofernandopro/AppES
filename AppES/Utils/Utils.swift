//
//  Utils.swift
//  AppES
//
//  Created by Fernando Moreira on 03/11/23.
//

import Foundation

class Utils {
    
    static func formatCurrencyString(_ input: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "pt_BR") // Use Brazilian locale
        numberFormatter.currencySymbol = "" // Remove currency symbol
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        if let number = Double(input) {
            return numberFormatter.string(from: NSNumber(value: number))
        }
        
        return nil // Couldn't convert the string to a valid number
    }
    
}
