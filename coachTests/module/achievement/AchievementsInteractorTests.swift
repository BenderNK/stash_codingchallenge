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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockLocalDataManager = MockDependencyFactory.provideAchievementsLocalDataManager()
        mockRemoteDataManager = MockDependencyFactory.provideAchievementsRemoteDataManager()
        sut = AchievementsInteractor(achievementsLocalDataManager: mockLocalDataManager, achievementsRemoteDataManager: mockRemoteDataManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func makeSureThatInteractorCallsBothLocalAndRemoteDataManagers() {
        mockLocalDataManager.interactor = sut
        mockRemoteDataManager.interactor = sut
        sut.retrieveAchievements()

        mockLocalDataManager.fetchAchievementsExpectation = expectation(description: "local data manager's fetchAchievements should be invoked")
        mockLocalDataManager.saveAchievementsExpectation = expectation(description: "local data manager's saveAchievements should be invoked")
        mockRemoteDataManager.fetchAchievementsExpectation = expectation(description: "local data manager's saveAchievements should be invoked")
                
        waitForExpectations(timeout: 10) { error in
            print(error?.localizedDescription ?? "")
        }
    }
}
