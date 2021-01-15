//
//  MockRemoteDataFetched.swift
//  coachTests
//
//  Created by Turker Nessa Kucuk on 1/14/21.
//

import XCTest
@testable import coach

class MockRemoteDataFetched: RemoteDataFetchedProtocol {
    var didFetchAchievementsFromRemoteExpectation: XCTestExpectation?
    var didFailFetchingAchievementsFromRemoteExpectation: XCTestExpectation?
    
    func didFetchAchievementsFromRemote(_ achievements: [Achievement]) {
        print("I received achivement data from remote")
        didFetchAchievementsFromRemoteExpectation?.fulfill()
    }
    
    func didFailFetchingAchievementsFromRemote(error: StashError) {
        print("uh oh... something is out of order.")
        didFailFetchingAchievementsFromRemoteExpectation?.fulfill()
    }
}
