//
//  MovieListViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation

class MovieListViewModel {
    private let repository: Repository<MovieDataModel>
    private let navigator: MovieNavigator
    private let service: ServiceManager
    
    init(service: ServiceManager, repository: Repository<MovieDataModel>, navigator: MovieNavigator) {
        self.repository = repository
        self.navigator = navigator
        self.service = service
    }
    
    func fetchMovieList() -> [MovieItemViewModel] {
        var itemViewModel:[MovieItemViewModel] = []
        
        for item in repository.queryAll() {
            itemViewModel.append(MovieItemViewModel(with: item))
        }
        
        return itemViewModel
    }
    
 /*   func fetchFromAPI(completion: completionPopularList) -> [Movie] {
        service.getPopularMovies { list in
            for movie in list {
                self.repository.save(entity: movie.asDataModel())
            }
        }
    }*/
  
    private func transform(movies: [MovieDataModel]) -> [MovieItemViewModel] {
        var items: [MovieItemViewModel] = []
        for movie in movies {
            items.append(MovieItemViewModel(with: movie))
        }
        return items
    }
}
