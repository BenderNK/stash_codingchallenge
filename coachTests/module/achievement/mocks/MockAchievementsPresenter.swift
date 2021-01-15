//
//  MockAchievementsPresenter.swift
//  coachTests
//
//  Created by Turker Nessa on 1/15/21.
//

import Foundation
import RxSwift
import RxCocoa
import XCTest
@testable import coach

class MockAchievementsPresenter: AchievementsPresenterProtocol {
    var didFetchAchievementsExpectation: XCTestExpectation?
    
    var shouldShowLoadingIndicator: Observable<Bool> {
        return shouldShowLoadingIndicatorRelay.asObservable()
    }
    
    var displayError: Observable<ErrorMessageComponents> {
        return displayErrorRelay.asObservable()
    }
    
    var displayAchievements: Observable<[AchievementModel]> {
        return displayAchievementsRelay.asObservable()
    }
    
    var interactor: AchievementsInteractorInputProtocol?
    
    
    private let shouldShowLoadingIndicatorRelay = PublishRelay<Bool>()
    private let displayErrorRelay = PublishRelay<ErrorMessageComponents>()
    private let displayAchievementsRelay = PublishRelay<[AchievementModel]>()
    
    func viewDidLoad() {
    }

    func didFetchAchievements(_ achievements: [AchievementModel]) {
        didFetchAchievementsExpectation?.fulfill()
    }

    func didFailFetchingAchievements(error: StashError) {
    }
}
