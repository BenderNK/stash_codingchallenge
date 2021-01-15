//
//  AchievementsPresenterTests.swift
//  coachTests
//
//  Created by Turker Nessa on 1/14/21.
//

import XCTest
import RxSwift
@testable import coach

class AchievementsPresenterTests: XCTestCase {
    
    //sut = sytem under test
    private var sut: AchievementsPresenterProtocol!
    private var mockInteractor: MockAchievementsInteractor!
    private let disposeBag = DisposeBag()
    private var shouldShowLoadingIndicatorExpectation: XCTestExpectation?
    private var displayAchievementsExpectation: XCTestExpectation?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockInteractor = MockDependencyFactory.provideAchievementsInteractor()
        sut = AchievementsPresenter()
        sut.interactor = mockInteractor
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testViewLoadsProperly() throws {
        shouldShowLoadingIndicatorExpectation = expectation(description: "once view loads, we should show a loading indicator")
        mockInteractor.retrieveAchievementsExpectation = expectation(description: "interactor should invoke retrieve achievements")
        
        sut.shouldShowLoadingIndicator.subscribe(onNext: { shouldShow in
            if shouldShow {
                self.shouldShowLoadingIndicatorExpectation?.fulfill()
            }
        }).disposed(by: disposeBag)
        
        sut.viewDidLoad()
                
        waitForExpectations(timeout: 10) { error in
            print(error?.localizedDescription ?? "")
        }
    }
    
    func testPresenterIsNotifiedWhenDataIsRetrieved() throws {
        shouldShowLoadingIndicatorExpectation = expectation(description: "once view loads, we should stop showing a loading indicator")
        displayAchievementsExpectation = expectation(description: "view should display the data once the achievements are received")
        
        sut.shouldShowLoadingIndicator
        .subscribe(onNext: { shouldShow in
            if !shouldShow {
                self.shouldShowLoadingIndicatorExpectation?.fulfill()
            }
        }).disposed(by: disposeBag)
        
        sut.displayAchievements
        .subscribe(onNext: { achievements in
            if achievements.count == 2 {
                self.displayAchievementsExpectation?.fulfill()
            }
        }).disposed(by: disposeBag)
        
        let achievement2 = [MockAchievementProvider.accessibleAchievement1, MockAchievementProvider.inaccessibleAchievement1]
        sut.didFetchAchievements(achievement2.map { AchievementModel(with: $0) })
                
        waitForExpectations(timeout: 10) { error in
            print(error?.localizedDescription ?? "")
        }
    }
}
