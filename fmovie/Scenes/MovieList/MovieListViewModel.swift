//
//  MovieListViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import RxSwift

class MovieListViewModel {
    private let repository: Repository<MovieDataModel>
    private let navigator: MovieNavigator
    
    init(repository: Repository<MovieDataModel>, navigator: MovieNavigator) {
        self.repository = repository
        self.navigator = navigator
    }
    
    func fetchMovieList() -> Observable<[MovieItemViewModel]> {
        return self.repository.queryAll().map { self.transform(movies: $0) }
    }
  
    private func transform(movies: [MovieDataModel]) -> [MovieItemViewModel] {
        var items: [MovieItemViewModel] = []
        for movie in movies {
            items.append(MovieItemViewModel(with: movie))
        }
        return items
    }
    
    /*func fetchMovieList() {
        networkProvider.getPopularMovies(completion: { list in
            for movie in list {
                print("value:: \(movie.title)")
            }
        })
    }*/
}
