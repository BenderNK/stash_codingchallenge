//
//  MockLocalDataFetchedProtocol.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import Foundation
import XCTest
@testable import coach

class MockLocalDataFetched: LocalDataFetchedProtocol {
    var didFetchAchievementsFromCacheExpectation: XCTestExpectation?
    var didCacheAchievementsExpectation: XCTestExpectation?
    
    func didFetchAchievementsFromCache(_ achievements: [Achievement]) {
        print("I received achivement data from cache")
        didFetchAchievementsFromCacheExpectation?.fulfill()
    }
    
    func didCacheAchievements() {
        print("somebody appears to have successfully saved data to disk.")
        didCacheAchievementsExpectation?.fulfill()
    }
}
