//
//  AchievementsRemoteDataManager.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

class AchievementsRemoteDataManager: AchievementsRemoteDataManagerProtocol {
    private let networkQueue: DispatchQueue
    weak var interactor: RemoteDataFetchedProtocol?
    
    //used to manipulate achievements.json file name so that we can easily simulate a failure
    //you wouldn't do this in a shipping application
    private var resourceName = "achievements"
    private var resourceExtension = "json"
    
    
    required init(networkQueue: DispatchQueue) {
        self.networkQueue = networkQueue
    }
    
    
    func register(resourceName: String, resourceExtension: String) {
        self.resourceName = resourceName
        self.resourceExtension = resourceExtension
    }
    
    func fetchAchievements() {
        //simulate a network call by doing the work 2 seconds from now
        networkQueue.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            guard let strongSelf = self else { return }
            guard let achievementsFileUrl = Bundle.main.url(forResource: strongSelf.resourceName, withExtension: strongSelf.resourceExtension) else {
                strongSelf.interactor?.didFailFetchingAchievementsFromRemote(error: StashError.achievementsFileIsNotContainedInBundle)
                return
            }
            do {
                let achievementsData = try Data(contentsOf: achievementsFileUrl)
                let decodedAchievements = try JSONDecoder().decode(AchievementsResponse.self, from: achievementsData)
                if decodedAchievements.success {
                    strongSelf.interactor?.didFetchAchievementsFromRemote(decodedAchievements.achievements)
                } else {
                    strongSelf.interactor?.didFailFetchingAchievementsFromRemote(error: StashError.networkingIssueWhileRetrievingAchievements)
                }
            } catch {
                strongSelf.interactor?.didFailFetchingAchievementsFromRemote(error: StashError.achievementFileCannotBeDecoded)
            }
        })
    }
}

