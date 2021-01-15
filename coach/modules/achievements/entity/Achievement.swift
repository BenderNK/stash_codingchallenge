//
//  Achievement.swift
//  coach
//
//  Created by Turker Nessa on 1/13/21.
//

import Foundation

struct Achievement: Hashable, Codable {
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let backgroundImageUrlString: String
    let accessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case backgroundImageUrlString = "bg_image_url"
        case accessible
    }
    
    var backgroundImageUrl: URL? {
        return URL(string: backgroundImageUrlString)
    }
}
