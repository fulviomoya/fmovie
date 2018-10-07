//
//  MovieItemViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

final class MovieItemViewModel {
    let favoriteIndicator: Bool
    let posterImageURL: String
    let title: String
    let rating: String
    
    init(with movie: MovieDataModel) {
        self.title = movie.title
        self.rating = String(movie.rating)
        self.posterImageURL = movie.posterPath
        self.favoriteIndicator = movie.isFavorite
    }
}
