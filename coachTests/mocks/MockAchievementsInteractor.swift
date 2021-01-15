//
//  MockAchievementsInteractor.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
@testable import coach


class MockAchievementsInteractor: AchievementsInteractorInputProtocol, LocalDataFetchedProtocol, RemoteDataFetchedProtocol {
    let achievementsLocalDataManager: AchievementsLocalDataManagerProtocol
    let achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol
    
    required init(achievementsLocalDataManager: AchievementsLocalDataManagerProtocol,
                  achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol) {
        self.achievementsLocalDataManager = achievementsLocalDataManager
        self.achievementsRemoteDataManager = achievementsRemoteDataManager
    }
    
    var presenter: AchievementsInteractorOutputProtocol?

    
    func retrieveAchievements() {
    }
    
    func didFetchAchievementsFromCache(_ achievements: [Achievement]) {
    }
    
    func didCacheAchievements() {
    }
    
    func didFetchAchievementsFromRemote(_ achievements: [Achievement]) {
    }
    
    func didFailFetchingAchievementsFromRemote(error: StashError) {
    }
}
