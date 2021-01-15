//
//  AchievementsLocalDataManager.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

class AchievementsLocalDataManager: AchievementsLocalDataManagerProtocol {
    private let ioQueue: DispatchQueue
    weak var interactor: LocalDataFetchedProtocol?
    
    //we will use an in-memory array to simulate reading/writing to disk
    private var cachedAchievements = [Achievement]()
    
    required init(ioQueue: DispatchQueue) {
        self.ioQueue = ioQueue
    }
    
    func fetchAchievements() {
        //simulate disk read operations by doing the work 2 seconds from now
        ioQueue.asyncAfter(deadline: .now() + 2, execute: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.interactor?.didFetchAchievementsFromCache(strongSelf.cachedAchievements)
        })
    }
    
    func saveAchievements(_ achievements: [Achievement]) {
        //simulate disk write operations by using a dedicated queue
        ioQueue.asyncAfter(deadline: .now(), execute: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.cachedAchievements = achievements
            strongSelf.interactor?.didCacheAchievements()
        })
    }
}

