//
//  MovieDetailViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    private let repository: Repository<MovieDataModel>
    private let navigator: MovieNavigator
    
    init(repository: Repository<MovieDataModel>, navigator: MovieNavigator) {
        self.repository = repository
        self.navigator = navigator
    }
}
