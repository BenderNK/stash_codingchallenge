//
//  AchievementModel.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

struct AchievementModel: Hashable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let backgroundImageUrl: URL?
    let accessible: Bool
    
    init(with dataModel: Achievement) {
        self.id = dataModel.id
        self.level = dataModel.level
        self.progress = dataModel.progress
        self.total = dataModel.total
        self.backgroundImageUrl = URL(string: dataModel.backgroundImageUrlString)
        self.accessible = dataModel.accessible
    }
}
