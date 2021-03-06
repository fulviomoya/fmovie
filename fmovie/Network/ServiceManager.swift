//
//  ServiceManager.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import Firebase
import Moya

typealias completionPopularList = ([Movie]) -> ()
typealias completionImage = (Image) -> ()

protocol Networkable {
    var provider: MoyaProvider<ServiceAPI> { get }
    func getPopularMovies(completion: @escaping completionPopularList)
}

struct ServiceManager: Networkable {
    var provider = MoyaProvider<ServiceAPI>() /*plugins: [NetworkLoggerPlugin(verbose: true)]*/
    
    func getPopularMovies(completion: @escaping completionPopularList) {
        RemoteConfig.remoteConfig().fetch() { status, error in
            RemoteConfig.remoteConfig().activateFetched()
            print(InformationMessages.SUCCESS_FETCH_PREFERENCE.rawValue)
            
            self.provider.request(.getPopularMovie()) { event in
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
}
