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
    
    func didFetchAchievementsFromCache(_ achievements: [Achievement]) {
        print("I received achivement data from cache")
        didFetchAchievementsFromCacheExpectation?.fulfill()
    }
    
    func didCacheAchievements() {
        print("somebody appears to have successfully saved data to disk.")
        didCacheAchievementsExpectation?.fulfill()
    }
    

    
    func didFetchAchievementsFromRemote(_ achievements: [Achievement]) {
        print("I received achivement data from remote")
        didFetchAchievementsFromRemoteExpectation?.fulfill()
    }
    
    func didFailFetchingAchievementsFromRemote(error: StashError) {
        print("uh oh... something is out of order.")
        didFailFetchingAchievementsFromRemoteExpectation?.fulfill()
    }
    
    var presenter: AchievementsInteractorOutputProtocol?
    
    func retrieveAchievements() {
        
    }
}
