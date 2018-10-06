//
//  Movie.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

struct Movie: Decodable {
     let uid: Int
     let title: String
     let rating: Float
     let sinopsis: String
     let posterPath: String
     let publicationDate: String
    
    private enum CodingKeys: String, CodingKey {
        case uid = "id"
        case title
        case rating = "vote_average"
        case sinopsis = "overview"
        case posterPath = "poster_path"
        case publicationDate = "release_date"
    }
    
     init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uid = try container.decode(Int.self, forKey: .uid)
        title = try container.decode(String.self, forKey: .title)
        rating = try container.decode(Float.self, forKey: .rating)
        sinopsis = try container.decode(String.self, forKey: .sinopsis)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        publicationDate = try container.decode(String.self, forKey: .publicationDate)
    }
}

extension Movie: Equatable {
     static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.uid == rhs.uid && lhs.title == rhs.title
    }
}
