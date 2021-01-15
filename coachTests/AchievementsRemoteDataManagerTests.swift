//
//  coachTests.swift
//  coachTests
//
//  Created by Turker Nessa on 1/13/21.
//

import XCTest
@testable import coach

class AchievementsRemoteDataManagerTests: XCTestCase {
    
    //sut = sytem under test
    private var sut: AchievementsRemoteDataManagerProtocol!
    private var mockNetworkQueue: DispatchQueue!
    private var interactor: MockRemoteDataFetched!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockNetworkQueue = MockDependencyFactory.provideNetworkQueue()
        sut = AchievementsRemoteDataManager(networkQueue: mockNetworkQueue)
        interactor = MockDependencyFactory.provideRemoteDataFetchedProtocol()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testWhetherLocalDataManagerCallsInteractorAfterFetchingData() throws {
        sut.interactor = interactor
        interactor.didFetchAchievementsFromRemoteExpectation = expectation(description: "remote data manager should call the interactor after fetching data")
        sut.fetchAchievements()
        
        waitForExpectations(timeout: 3) { error in
            print(error?.localizedDescription ?? "")
        }
    }

    func testWhetherLocalDataManagerCallsInteractorAfterCachingData() throws {
        sut.interactor = interactor
        interactor.didFailFetchingAchievementsFromRemoteExpectation = expectation(description: "remote data manager should call the interactor if there is a failure")
        sut.register(resourceName: "non-existing-resource-name", resourceExtension: "json")
        sut.fetchAchievements()
        
        waitForExpectations(timeout: 3) { error in
            print(error?.localizedDescription ?? "")
        }
    }

}
