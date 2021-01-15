//
//  MockAchievementsRemoteDataManager.swift
//  coachTests
//
//  Created by Turker Nessa on 1/15/21.
//

import XCTest
@testable import coach

class MockAchievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol {
    var interactor: RemoteDataFetchedProtocol?
    let networkQueue: DispatchQueue
    
    var fetchAchievementsExpectation: XCTestExpectation?
    
    required init(networkQueue: DispatchQueue) {
        self.networkQueue = networkQueue
    }
    
    func register(resourceName: String, resourceExtension: String) {
        //optional function - does not need to be invoked
    }
    
    func fetchAchievements() {
        interactor?.didFetchAchievementsFromRemote([MockAchievementProvider.inaccessibleAchievement1])
        fetchAchievementsExpectation?.fulfill()
    }
}
