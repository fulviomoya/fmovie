//
//  Service.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Moya

enum ServiceAPI {
    case getMovies(id: Int)
    case getPopularMovie()
}

extension ServiceAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.API_ENDPOINT.rawValue) else {
            fatalError(ErrorMessage.NOT_FOUND.rawValue)
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .getMovies(let id):
            return "\(id)"
        case .getPopularMovie():
            return "movie/popular"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getMovies:
            return .requestParameters(parameters: ["api_key":  Constants.APIKey],
                                      encoding: URLEncoding.queryString)
            
        case .getPopularMovie:
            return .requestParameters(parameters: ["api_key":  Constants.APIKey,
                                                   "language": "en-US"],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
