//
//  MovieListViewModel.swift
//  fmovie
//
//  Created by Fulvio Moya  on 10/6/18.
//  Copyright © 2018 F. Moya. All rights reserved.
//

import Foundation
import UIKit

class MovieListViewModel {
    private let repository: Repository<MovieDataModel>
    private let viewController: MovieListViewController?
    private let service: ServiceManager
    
    var movies: [MovieItemViewModel]? {
        didSet {
            self.viewController?.updateUI(with: self.movies)
        }
    }
    
    init(viewController: MovieListViewController) {
        self.viewController = viewController
        self.repository = Application.shared.serviceLocator.getRepository()
        self.service = Application.shared.serviceManager
        
        NotificationCenter.default.addObserver(self, selector: #selector(refresh(notification: )),
                                               name: .updateMovies, object: nil)
        fetchMovieList()
    }
    
    @objc func fetchMovieList() {
        if repository.queryAll().count == 0 {
            service.getPopularMovies { list in
                for movie in list {
                    self.repository.save(entity: movie.asDataModel())
                }
                
                //Notify any posible observers
                NotificationCenter.default.post(name: .updateMovies, object: nil)
            }
        }
        bindMovies()
    }
    
    @objc func refresh(notification: NSNotification){
        bindMovies()
    }
    
    fileprivate func bindMovies() {
        var itemViewModel:[MovieItemViewModel] = []
        repository.queryAll().forEach { item in
            itemViewModel.append(MovieItemViewModel(with: item))
        }
        
        self.movies = itemViewModel
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
