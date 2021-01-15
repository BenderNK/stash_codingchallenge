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
    
    class func provideLocalDataFetchedProtocol() -> MockLocalDataFetched {
        return MockLocalDataFetched()
    }
    
    class func provideRemoteDataFetchedProtocol() -> MockRemoteDataFetched {
        return MockRemoteDataFetched()
    }
    
    class func provideAchievementsLocalDataManager() -> MockAchievementsLocalDataManager {
        return MockAchievementsLocalDataManager(ioQueue: provideIOQueue())
    }
    
    class func provideAchievementsRemoteDataManager() -> MockAchievementsRemoteDataManager {
        return MockAchievementsRemoteDataManager(networkQueue: provideNetworkQueue())
    }
    
    class func provideAchievementsPresenter() -> MockAchievementsPresenter {
        return MockAchievementsPresenter(interactor: provideinter)
    }
}
