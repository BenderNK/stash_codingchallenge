//
//  MockAchievementsInteractor.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
import XCTest
@testable import coach


class MockAchievementsInteractor: AchievementsInteractorInputProtocol, LocalDataFetchedProtocol, RemoteDataFetchedProtocol {
    let achievementsLocalDataManager: AchievementsLocalDataManagerProtocol
    let achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol
    
    required init(achievementsLocalDataManager: AchievementsLocalDataManagerProtocol,
                  achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol) {
        self.achievementsLocalDataManager = achievementsLocalDataManager
        self.achievementsRemoteDataManager = achievementsRemoteDataManager
    }
    
    var didFetchAchievementsFromCacheExpectation: XCTestExpectation?
    var didCacheAchievementsExpectation: XCTestExpectation?
    var didFetchAchievementsFromRemoteExpectation: XCTestExpectation?
    var didFailFetchingAchievementsFromRemoteExpectation: XCTestExpectation?
    var retrieveAchievementsExpectation: XCTestExpectation?
    
    func didFetchAchievementsFromCache(_ achievements: [Achievement]) {
        didFetchAchievementsFromCacheExpectation?.fulfill()
    }
    
    func didCacheAchievements() {
        didCacheAchievementsExpectation?.fulfill()
    }

    
    func didFetchAchievementsFromRemote(_ achievements: [Achievement]) {
        presenter?.didFetchAchievements(achievements.map { AchievementModel(with: $0) })
        didFetchAchievementsFromRemoteExpectation?.fulfill()
    }
    
    func didFailFetchingAchievementsFromRemote(error: StashError) {
        presenter?.didFailFetchingAchievements(error: error)
        didFailFetchingAchievementsFromRemoteExpectation?.fulfill()
    }
    
    var presenter: AchievementsInteractorOutputProtocol?
    
    func retrieveAchievements() {
        retrieveAchievementsExpectation?.fulfill()
    }
}
