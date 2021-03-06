//
//  MovieItemViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/7/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

final class MovieItemViewModel {
    let id: Int
    var favoriteIndicator: Bool
    let posterImageURL: String
    let title: String
    let rating: Float
    let sipnosis: String
    let publicationDate: String
    
    init(with movie: MovieDataModel) {
        self.id = movie.id
        self.title = movie.title
        self.rating = movie.rating
        self.posterImageURL = movie.posterPath
        self.favoriteIndicator = movie.isFavorite
        self.sipnosis = movie.sinopsis
        self.publicationDate = movie.publicationDate
    }
}
