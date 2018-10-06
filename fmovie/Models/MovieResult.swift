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

    private enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try container.decode(Int.self, forKey: .page)
        movies = try container.decode([Movie].self, forKey: .movies) 
    }
}
