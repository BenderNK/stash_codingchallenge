//
//  AchievementInteractor.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

class AchievementInteractor: AchievementsInteractorInputProtocol {
    let achievementsLocalDataManager: AchievementsLocalDataManagerProtocol
    let achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol
    
    weak var presenter: AchievementsInteractorOutputProtocol?
    
    required init(achievementsLocalDataManager: AchievementsLocalDataManagerProtocol,
         achievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol) {
        self.achievementsLocalDataManager = achievementsLocalDataManager
        self.achievementsRemoteDataManager = achievementsRemoteDataManager
        
        achievementsLocalDataManager.interactor = self
        achievementsRemoteDataManager.interactor = self
    }
    
    func retrieveAchievements() {
        //first we'll ask the local data manager to retrieve already cached items if any
        //if local data manager does not return any items, then we'll make a network call
        //to retrieve the data over http
        achievementsLocalDataManager.fetchAchievements()
    }
}

extension AchievementInteractor: LocalDataFetchedProtocol {
    func didFetchAchievementsFromCache(_ achievements: [Achievement]) {
        if achievements.isEmpty {
            //there is no data in the cache - ask the remote manager to retrieve the items over http
            achievementsRemoteDataManager.fetchAchievements()
        } else {
            //great, we already cached the items, directly send the data back to presenter
            let achievementModels = achievements.map { AchievementModel(with: $0) }
            presenter?.didFetchAchievements(achievementModels)
        }
    }
    
    func didCacheAchievements() {
        print("hip hip hooray. from now on, we can directly get the data from the local cache!!!")
    }
}

extension AchievementInteractor: RemoteDataFetchedProtocol {
    func didFetchAchievementsFromRemote(_ achievements: [Achievement]) {
        //since we just received a fresh copy of the data from remote, save them locally for re-use
        achievementsLocalDataManager.saveAchievements(achievements)
        
        //then notify presenter of the newly loaded data
        let achievementModels = achievements.map { AchievementModel(with: $0) }
        presenter?.didFetchAchievements(achievementModels)
    }
    
    func didFailFetchingAchievementsFromRemote(error: StashError) {
        //oops! propage the error to the view for user to deal with the appropriate actions
        presenter?.didFailFetchingAchievements(error: error)
    }
}
