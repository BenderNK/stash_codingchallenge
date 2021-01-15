//
//  MockAchievementsPresenter.swift
//  coachTests
//
//  Created by Turker Nessa on 1/15/21.
//

import RxSwift
import RxCocoa
@testable import coach

class MockAchievementsPresenter: AchievementsPresenterProtocol {
    //MARK: public properties
    var shouldShowLoadingIndicator: Observable<Bool> {
        return shouldShowLoadingIndicatorRelay.asObservable()
    }
    
    var displayError: Observable<ErrorMessageComponents> {
        return displayErrorRelay.asObservable()
    }
    
    var displayAchievements: Observable<[AchievementModel]> {
        return displayAchievementsRelay.asObservable()
    }
    
    let interactor: AchievementsInteractorInputProtocol
    
    //MARK: private properties
    private let shouldShowLoadingIndicatorRelay = PublishRelay<Bool>()
    private let displayErrorRelay = PublishRelay<ErrorMessageComponents>()
    private let displayAchievementsRelay = PublishRelay<[AchievementModel]>()
    
    init(interactor: AchievementsInteractorInputProtocol) {
        self.interactor = interactor
        self.interactor.presenter = self
    }
    
    func viewDidLoad() {
        //view signaled that it has loaded, we should display the loading indicator
        //shouldShowLoadingIndicatorRelay.accept(true)
        //interactor.retrieveAchievements()
    }
}

extension MockAchievementsPresenter: AchievementsInteractorOutputProtocol {
    func didFetchAchievements(_ achievements: [AchievementModel]) {
        //we managed to load the data, stop the loading indicator
        //shouldShowLoadingIndicatorRelay.accept(false)
        //displayAchievementsRelay.accept(achievements)
    }

    func didFailFetchingAchievements(error: StashError) {
        //shouldShowLoadingIndicatorRelay.accept(false)
        //displayErrorRelay.accept(error.toErrorMessageComponents())
    }
}
