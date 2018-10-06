//
//  MovieResult.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

struct MovieResult: Decodable {
    let page: Int
    let movies: [Movie]
    let numberOfPages: Int
    let numberOfResults: Int

    private enum CodingKeys: String, CodingKey {
        case page
        case movies
        case numberOfPages
        case numberOfResults
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        movies = try container.decode([Movie].self, forKey: .movies)
        numberOfPages = try container.decode(Int.self, forKey: .numberOfPages)
        numberOfResults = try container.decode(Int.self, forKey: .numberOfResults)
    }
}
