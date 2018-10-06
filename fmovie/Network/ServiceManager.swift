//
//  ServiceManager.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Moya
import RxSwift

typealias completionPopularList = ([Movie]) -> ()

protocol Networkable {
    var provider: MoyaProvider<ServiceAPI> { get }
    func getPopularMovies(completion: @escaping completionPopularList)
}

struct ServiceManager: Networkable {
    static let APIKey: String = "5eaeace73d141434b339e94b554e632b"
    
    var provider = MoyaProvider<ServiceAPI>(/*plugins: [NetworkLoggerPlugin(verbose: true)]*/)
    
    func getPopularMovies(completion: @escaping completionPopularList){
        provider.request(.getPopularMovie()) { event in
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
