//
//  AchievementsResponse.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

struct AchievementsResponse: Hashable, Codable {
    let success: Bool
    let status: Int
    let overview: OverviewInfo
    let achievements: [Achievement]
}

struct OverviewInfo: Hashable, Codable {
    let title: String
}
