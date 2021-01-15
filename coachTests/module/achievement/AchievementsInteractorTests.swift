//
//  AchievementInteractorTests.swift
//  coachTests
//
//  Created by Turker Nessa on 1/14/21.
//

import XCTest
@testable import coach

class AchievementsInteractorTests: XCTestCase {
    
    //sut = sytem under test
    private var sut: AchievementsInteractorInputProtocol!
    private var mockLocalDataManager: MockAchievementsLocalDataManager!
    private var mockRemoteDataManager: MockAchievementsRemoteDataManager!
    private var mockPresenter: MockAchievementsPresenter!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLocalDataManager = MockDependencyFactory.provideAchievementsLocalDataManager()
        mockRemoteDataManager = MockDependencyFactory.provideAchievementsRemoteDataManager()
        mockPresenter = MockDependencyFactory.provideAchievementsPresenter()
        
        sut = AchievementsInteractor(achievementsLocalDataManager: mockLocalDataManager, achievementsRemoteDataManager: mockRemoteDataManager)
        sut.presenter = mockPresenter
        mockPresenter.interactor = sut
        mockLocalDataManager.interactor = sut
        mockRemoteDataManager.interactor = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testWhetherInteractorCallsNotifiesPresenterAfterRetrievingData() throws {
        mockLocalDataManager.fetchAchievementsExpectation = expectation(description: "local data manager's fetchAchievements should be invoked")
        mockLocalDataManager.saveAchievementsExpectation = expectation(description: "local data manager's saveAchievements should be invoked")
        mockRemoteDataManager.fetchAchievementsExpectation = expectation(description: "local data manager's saveAchievements should be invoked")
        mockPresenter.didFetchAchievementsExpectation = expectation(description: "when all the data is fetched, presenter's didFetchAchievements(_:) should be invoked")
        
        sut.retrieveAchievements()
        
        waitForExpectations(timeout: 2) { error in
            print(error?.localizedDescription ?? "")
        }
    }
}
