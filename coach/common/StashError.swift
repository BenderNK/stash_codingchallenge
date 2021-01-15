//
//  StashError.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation

enum StashError: Int, Error {
    case achievementsFileIsNotContainedInBundle
    case achievementFileCannotBeDecoded
    case networkingIssueWhileRetrievingAchievements
    
    var errorCode: Int {
        return rawValue
    }
    
    var localizedDescription: String {
        switch self {
        case .achievementsFileIsNotContainedInBundle, .achievementFileCannotBeDecoded:
            return "unrecoverable_achievement_issue".localized()
        case .networkingIssueWhileRetrievingAchievements:
            return "recoverable_achievement_issue".localized()
        }
    }
    
    func toErrorMessageComponents() -> ErrorMessageComponents {
        ErrorMessageComponents(title: "error_title".localized(),
                               message: self.localizedDescription,
                               acknowledgementButtonText: "ok".localized())
    }
}
