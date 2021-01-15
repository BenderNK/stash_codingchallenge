//
//  AchievementsWireFrame.swift
//  coach
//
//  Created by Turker Nessa on 1/15/21.
//

import UIKit

class AchievementsWireFrame {
    class func createAchievementsVC() -> UIViewController {
        let achievementsVC = AchievementsView()
        let presenter: AchievementsPresenterProtocol = DependencyFactory.provideAchivementsPresenter()
        let interactor: AchievementsInteractorInputProtocol = DependencyFactory.provideAchievementInteractor()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        achievementsVC.achievementsPresenter = presenter
        
        let navController = UINavigationController(rootViewController: achievementsVC)
        return navController
    }
}
