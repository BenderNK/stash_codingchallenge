//
//  MockAchievementProvider.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
@testable import coach

class MockAchievementProvider {
    static var accessibleAchievement1: Achievement {
        Achievement(id: 9,
                    level: "4",
                    progress: 23,
                    total: 50,
                    backgroundImageUrlString: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
                    accessible: true)
    }
    
    static var inaccessibleAchievement1: Achievement {
        Achievement(id: 12,
                    level: "7",
                    progress: 0,
                    total: 50,
                    backgroundImageUrlString: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
                    accessible: false)
    }
}
