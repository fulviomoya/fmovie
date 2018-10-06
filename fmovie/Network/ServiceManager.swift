//
//  ServiceManager.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
    func getMovieList(identifier: Int, completion: @escaping ([Movie]) -> ())
}

struct ServiceManager: Network {
    static let APIKey: String = ""
    
    var provider = MoyaProvider<ServiceAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getMovieList(identifier: Int, completion: @escaping ([Movie]) -> ()) {
        provider.request(.getMovies(id: identifier)) { event in
            switch event {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(MovieResult.self, from: response.data)
                    completion(result.movies)
                } catch let err {
                    print(err)
                }
            case .failure(let error):
                print(error)
            }
        } 
    }
}
