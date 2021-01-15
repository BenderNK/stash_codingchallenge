//
//  coachTests.swift
//  coachTests
//
//  Created by Turker Nessa on 1/13/21.
//

import XCTest
@testable import coach

class AchievementsLocalDataManagerTests: XCTestCase {
    
    //sut = sytem under test
    private var sut: AchievementsLocalDataManagerProtocol!
    private var mockIOQueue: DispatchQueue!
    private var interactor: MockLocalDataFetched!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockIOQueue = MockDependencyFactory.provideIOQueue()
        sut = AchievementsLocalDataManager(ioQueue: mockIOQueue)
        interactor = MockDependencyFactory.provideLocalDataFetchedProtocol()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testWhetherLocalDataManagerCallsInteractorAfterFetchingData() throws {
        sut.interactor = interactor
        interactor.didFetchAchievementsFromCacheExpectation = expectation(description: "local data manager should call the interactor after fetching data")
        sut.fetchAchievements()
        
        waitForExpectations(timeout: 3) { error in
            print(error?.localizedDescription ?? "")
        }
    }

    func testWhetherLocalDataManagerCallsInteractorAfterCachingData() throws {
        sut.interactor = interactor
        interactor.didCacheAchievementsExpectation = expectation(description: "local data manager should call the interactor after caching data")
        sut.saveAchievements([MockAchievementProvider.accessibleAchievement1])
        
        waitForExpectations(timeout: 3) { error in
            print(error?.localizedDescription ?? "")
        }
    }

}
