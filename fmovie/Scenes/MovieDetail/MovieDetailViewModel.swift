//
//  MovieDetailViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    private let movie: MovieDataModel
    private let navigator: MovieDetailNavigator
    
    init(movie: MovieDataModel, navigator: MovieDetailNavigator) {
        self.movie = movie
        self.navigator = navigator
    }
}
