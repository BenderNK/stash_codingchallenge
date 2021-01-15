//
//  MockDependencyFactory.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
@testable import coach

class MockDependencyFactory {
    class func provideIOQueue() -> DispatchQueue {
        return DispatchQueue(label: "test.ioqueue")
    }
    
    class func provideNetworkQueue() -> DispatchQueue {
        return DispatchQueue(label: "test.networkqueue")
    }
    
    /*
     class func provideAchievementInteractor() -> AchievementsInteractorInputProtocol {
         return MockAchievementsInteractor(achievementsLocalDataManager: provideAchievementsLocalDataManager(),
                                      achievementsRemoteDataManager: provideAchievementsRemoteDataManager())
     }
     
     class func provideAchivementsPresenter() -> AchievementsPresenterProtocol {
         return AchievementsPresenter(interactor: provideAchievementInteractor())
     }
     */
    
    class func provideAchievementsLocalDataManager() -> AchievementsLocalDataManagerProtocol {
        return MockAchievementsLocalDataManager(ioQueue: MockDependencyFactory.provideIOQueue())
    }
    
    class func provideAchievementsRemoteDataManager() -> AchievementsRemoteDataManagerProtocol {
        return AchievementsRemoteDataManager(networkQueue: provideNetworkQueue())
    }
    
    class func provideLocalDataFetchedProtocol() -> MockLocalDataFetched {
        return MockLocalDataFetched()
    }
    
    class func provideRemoteDataFetchedProtocol() -> MockRemoteDataFetched {
        return MockRemoteDataFetched()
    }
}
