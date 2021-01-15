//
//  ErrorMessageComponents.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation

/// You use ErrorMessageComponents to convert a StashError to ready-to-display UIAlert parts.
struct ErrorMessageComponents {
    let title: String
    let message: String
    let acknowledgementButtonText: String
}
