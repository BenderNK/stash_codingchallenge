//
//  String+Extensions.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation

/// Shorthand to use repetetive localization functions
extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
    
    func localized(parameters: CVarArg...) -> String {
        return String(format: self.localized(), arguments: parameters)
    }
}
