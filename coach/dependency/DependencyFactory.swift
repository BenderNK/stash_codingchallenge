//
//  dependency.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation

class DependencyFactory {
    class func provideIOQueue() -> DispatchQueue {
        return DispatchQueue(label: "com.stash.codechallenge.ioqueue")
    }
    
    class func provideNetworkQueue() -> DispatchQueue {
        return DispatchQueue(label: "com.stash.codechallenge.networkqueue")
    }
    
    class func provideAchievementsLocalDataManager() -> AchievementsLocalDataManagerProtocol {
        return AchievementsLocalDataManager(ioQueue: provideIOQueue())
    }
    
    class func provideAchievementsRemoteDataManager() -> AchievementsRemoteDataManagerProtocol {
        return AchievementsRemoteDataManager(networkQueue: provideNetworkQueue())
    }
    
    class func provideAchievementInteractor() -> AchievementsInteractorInputProtocol {
        return AchievementsInteractor(achievementsLocalDataManager: provideAchievementsLocalDataManager(),
                                     achievementsRemoteDataManager: provideAchievementsRemoteDataManager())
    }
    
    class func provideAchivementsPresenter() -> AchievementsPresenterProtocol {
        return AchievementsPresenter()
    }
}
