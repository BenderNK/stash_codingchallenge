//
//  MockAchievementsLocalDataManager.swift
//  coachTests
//
//  Created by Turker Nessa on 1/15/21.
//

import XCTest
@testable import coach

class MockAchievementsLocalDataManager: AchievementsLocalDataManagerProtocol {
    var fetchAchievementsExpectation: XCTestExpectation?
    var saveAchievementsExpectation: XCTestExpectation?
    
    var interactor: LocalDataFetchedProtocol?
    let ioQueue: DispatchQueue
    
    required init(ioQueue: DispatchQueue) {
        self.ioQueue = ioQueue
    }
    
    func fetchAchievements() {
        interactor?.didFetchAchievementsFromCache([])
        fetchAchievementsExpectation?.fulfill()
    }
    
    func saveAchievements(_ achievements: [Achievement]) {
        interactor?.didCacheAchievements()
        saveAchievementsExpectation?.fulfill()
    }
}
