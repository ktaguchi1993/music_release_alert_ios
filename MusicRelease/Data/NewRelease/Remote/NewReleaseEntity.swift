//
//  NewReleaseEntity.swift
//  MusicRelease
//
//  Created by ktaguchi on 2023/10/20.
//

import Foundation

struct NewReleaseEntity: Codable {
    var title: String
    var artist: String
    var releaseDate: Date
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case releaseDate = "release_date"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateString = try container.decode(String.self, forKey: .releaseDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            self.releaseDate = date
            title = try container.decode(String.self, forKey: .title)
            artist = try container.decode(String.self, forKey: .artist)
            url = try container.decode(String.self, forKey: .url)
        } else {
            throw DecodingError.dataCorruptedError(forKey: .releaseDate, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
    }
}

