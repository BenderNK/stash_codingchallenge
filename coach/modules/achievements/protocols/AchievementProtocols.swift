//
//  AchievementProtocols.swift
//  coach
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
import RxSwift

protocol AchievementsLocalDataManagerProtocol: class {
    var interactor: LocalDataFetchedProtocol? { get set }
    /// provide a dedicated queue for read/write operations
    init(ioQueue: DispatchQueue)
    
     // INTERACTOR -> LOCALDATAMANAGER
    func fetchAchievements()
    func saveAchievements(_ achievements: [Achievement])
}

protocol AchievementsRemoteDataManagerProtocol: class {
    var interactor: RemoteDataFetchedProtocol? { get set }
    /// provide a dedicated queue for networking operations
    init(networkQueue: DispatchQueue)
    
     // INTERACTOR -> REMOTEDATAMANAGER
    /// Instead of hardcoding "achievements.json", this information can also be provided by outside parties.
    /// needed for testing purposes.
    func register(resourceName: String, resourceExtension: String)
    func fetchAchievements()
}

protocol LocalDataFetchedProtocol: class {
     // LOCALDATAMANAGER -> INTERACTOR
    func didFetchAchievementsFromCache(_ achievements: [Achievement])
    func didCacheAchievements()
}

protocol RemoteDataFetchedProtocol: class {
     // REMOTEDATAMANAGER -> INTERACTOR
    func didFetchAchievementsFromRemote(_ achievements: [Achievement])
    func didFailFetchingAchievementsFromRemote(error: StashError)
}

protocol AchievementsInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didFetchAchievements(_ achievements: [AchievementModel])
    func didFailFetchingAchievements(error: StashError)
}

protocol AchievementsInteractorInputProtocol: LocalDataFetchedProtocol, RemoteDataFetchedProtocol {
    init(achievementsLocalDataManager: AchievementsLocalDataManagerProtocol,
         achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol)
    
    var presenter: AchievementsInteractorOutputProtocol? { get set }
    var achievementsLocalDataManager: AchievementsLocalDataManagerProtocol { get }
    var achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol { get }
    
    // PRESENTER -> INTERACTOR
    func retrieveAchievements()
}


protocol AchievementsPresenterProtocol {
    var interactor: AchievementsInteractorInputProtocol { get }
    var shouldShowLoadingIndicator: Observable<Bool> { get }
    var displayError: Observable<ErrorMessageComponents> { get }
    var displayAchievements: Observable<[AchievementModel]> { get }
    
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
